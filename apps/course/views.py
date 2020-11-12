from django.db.models import Q

from .models import Course,CourseResourse,Viedo
from utils.mixin_utils import LoginRequireMixin
from utils.page_utils import process_page
from operation.models import CourseComments, UserCourse
from django.shortcuts import render
from django.http import HttpResponse
from django.views.generic.base import View
# Create your views here.

class CourseListView(View):
    def get(self,request):
        page = request.GET.get("page",1)
        sort = request.GET.get("sort",'')

        all_course = Course.objects.all()

        hot_courses = Course.objects.order_by('-student_nums')[:2]
        if sort=='hot':
            all_course = all_course.order_by('-click_nums')
        if sort == 'students':
            all_course = all_course.order_by('-student_nums')
        # 搜索功能
        search_keywords = request.GET.get('keywords', '')
        if search_keywords:
            # icontains是包含的意思（不区分大小写）
            # Q可以实现多个字段，之间是or的关系
            all_course = all_course.filter(
                Q(name__icontains=search_keywords) | Q(desc__icontains=search_keywords) | Q(
                    detail__icontains=search_keywords))
        page_obj,page_li = process_page(page,all_course)


        context = {
            'all_course':page_obj,
            'hot_courses':hot_courses,
            'page_li':page_li,
            'sort':sort
        }
        return render(request,'course/course-list.html',context)

    def post(self,request):
        pass


class CourseDetailView(View):
    def get(self,request,course_id):
        course = Course.objects.get(id=course_id)
        # 课程的点击数+1
        course.click_nums+=1
        course.save()
        # 根据课程标签推荐相关课程
        tag = course.tag
        if tag:
            # 必须从1开始
            relate_course = Course.objects.filter(tag=tag)[1:3]
        else:
            relate_course = Course.objects.filter(course_org=course.course_org)[1:3]
            print('relate==',relate_course)
        context = {
            'course':course,
            'relate_course':relate_course,
        }
        return render(request,'course/course-detail.html',context)

    def post(self,request):
        pass


class CourseInfoView(LoginRequireMixin,View):
    def get(self,request,course_id):

        course = Course.objects.get(id=course_id)
        # 查询用户是否学习了该门课程
        if not UserCourse.objects.filter(user=request.user,course=course).exists():
            # 如果没有学习该门课程就关联起来
            user_course = UserCourse(user=request.user, course=course)
            user_course.save()
        # 相关课程推荐
        courses = UserCourse.objects.filter(course=course)
        user_ids = [user.id for user in courses]
        user_course = UserCourse.objects.filter(user__in=user_ids)
        course_ids = [c.id for c in user_course]
        relate_courses = Course.objects.filter(id__in=course_ids).order_by('-click_nums')[:5]
        all_resources = CourseResourse.objects.filter(course=course)

        context = {
            'course':course,
            'all_resources':all_resources,
            'relate_courses':relate_courses,
        }
        return render(request,'course/course-video.html',context)

    def post(self,request):
        pass


class CourseCommentsView(LoginRequireMixin,View):
    '''课程评论视图'''
    def get(self,request,course_id):
        course = Course.objects.get(id=course_id)
        all_resources = CourseResourse.objects.filter(course=course)
        # 所有评论
        all_comments = CourseComments.objects.filter(course=course).order_by('-add_time')
        # 相关课程推荐
        courses = UserCourse.objects.filter(course=course) # 先找到学习过这个课程的人
        user_ids = [course.user.id for course in courses]  #  算出学这个课程的人的id
        user_course = UserCourse.objects.filter(user__in=user_ids) # 根据学这么课程人的id 找出其他课程
        course_ids = [c.id for c in user_course]  # 求出来其他课程的id列表
        relate_courses = Course.objects.filter(id__in=course_ids).order_by('-click_nums')[:5] # 根据其他课程id列表，用点击量进行排序

        context = {
            'course': course,
            'all_resources': all_resources,
            'all_comments':all_comments,
            'relate_courses':relate_courses,
        }
        return render(request, 'course/course-comment.html', context)

    def post(self,request):
        pass


class AddCommentsView(View):
    def get(self,request):
        pass

    def post(self, request):
        if not request.user.is_authenticated:
            # 未登录时返回json提示未登录，跳转到登录页面是在ajax中做的
            return HttpResponse('{"status":"fail", "msg":"用户未登录"}', content_type='application/json')
        course_id = request.POST.get("course_id", 0)
        comments = request.POST.get("comments", "")
        if int(course_id) > 0 and comments:
            # 实例化一个course_comments对象
            course_comments = CourseComments()
            # 获取评论的是哪门课程
            course = Course.objects.get(id = int(course_id))
            # 分别把评论的课程、评论的内容和评论的用户保存到数据库
            course_comments.course = course
            course_comments.comments = comments
            course_comments.user = request.user
            course_comments.save()
            return HttpResponse('{"status":"success", "msg":"评论成功"}', content_type='application/json')
        else:
            return HttpResponse('{"status":"fail", "msg":"评论失败"}', content_type='application/json')


class VideoPlayView(View):
    def get(self,request,video_id):
        video = Viedo.objects.get(id=video_id)
        # 通过外键找到章节在找到视频对应的课程
        course = video.lesson.course
        # 给这个课程的学习人数+1
        course.student_nums+=1
        course.save()
        # 查询用户是否已经学习了该课程
        is_course = UserCourse.objects.filter(user=request.user, course=course).exists()
        if not is_course:
            # 如果没有学习该门课程就关联起来
            user_course = UserCourse(user=request.user, course=course)
            user_course.save()

        # 相关课程推荐：学习该课程的用户也学习了那些
        user_courses = UserCourse.objects.filter(course=course)
        user_ids = [course.user.id for course in user_courses]
        courses = UserCourse.objects.filter(user__in=user_ids)
        course_ids = [course.id for course in courses]
        relate_courses = Course.objects.filter(id__in=course_ids)
        all_resources = CourseResourse.objects.filter(course=course)
        context = {
            'course': course,
            'all_resources': all_resources,
            'relate_courses': relate_courses,
            'video': video,
        }
        return render(request,'course/course-play(1).html',context)

    def post(self,request):
        pass