from django.db.models import Q

from course.models import Course
from utils.page_utils import process_page
from .models import CityDict,CourseOrg,Teacher
from operation.models import UserFavorite
from .forms import UserAskForm
from django.shortcuts import render
from django.views.generic.base import View
from django.core.paginator import Paginator
from django.http import JsonResponse
# Create your views here.

class OrgView(View):
    def get(self,request):
        # 取出所有城市
        citys = CityDict.objects.all()
        # 取出所有机构  和 机构数量
        all_orgs = CourseOrg.objects.all()
        course_count = CourseOrg.objects.count()

        page = request.GET.get('page',1)
        city_id = request.GET.get('city','')
        ct = request.GET.get('ct','')
        sort = request.GET.get('sort','')

        if city_id:
            all_orgs =all_orgs.filter(city=city_id)
        if ct:
            all_orgs = all_orgs.filter(category=ct)
        if sort:
            if sort == 'students':
                all_orgs = all_orgs.order_by('-students')
            elif sort == 'courses':
                all_orgs = all_orgs.order_by('-course_nums')
        search_keywords = request.GET.get('keywords', '')
        if search_keywords:
            # 在name字段进行操作,做like语句的操作。i代表不区分大小写
            # or操作使用Q
            all_orgs = all_orgs.filter(Q(name__icontains=search_keywords) | Q(desc__icontains=search_keywords))

        # 取当前授课机构排名  前三名
        course_hots = all_orgs.order_by('-click_nums')[:3]
        # 当前页
        page_obj,page_li = process_page(page,all_orgs)

        print(page_li)
        context = {
            'citys':citys,
            'courses':page_obj,
            'course_count':course_count,
            'page_li':page_li,
            'city_id':city_id,
            'category':ct,
            'course_hots':course_hots,
            'sort':sort
        }


        return render(request, 'organization/org-list.html', context)

    def post(self,request):
        pass


class AddUserAskView(View):
    def post(self,request):
        forms = UserAskForm(request.POST)
        if forms.is_valid():
            # 如果验证成功，就保存数据库
            forms.save()

            return JsonResponse({'status':"success"})
        else:
            # 如果失败，返回JSON字符串，并将报错信息传回到前端
            return JsonResponse({"status":"fail",'msg':"添加出错"})


class OrgHomeView(View):
    '''机构首页展示'''
    def get(self,request,org_id):
        # 根据id找到课程机构
        course_org = CourseOrg.objects.get(id=org_id)
        course_org.click_nums +=1
        course_org.save()
        # 反向查询到所有老师以及课程
        all_course = course_org.course_set.all()[:4]
        all_teacher = course_org.teacher_set.all()[:2]

        context = {
            'course_org':course_org,
            'all_course':all_course,
            'all_teacher':all_teacher,
        }
        return render(request,'organization/org-detail-homepage.html',context)

    def post(self,request):
        pass


class OrgCourseView(View):
    def get(self,request,org_id):
        course_org = CourseOrg.objects.get(id=org_id)
        all_course = course_org.course_set.all()
        context = {
            'course_org':course_org,
            'all_course':all_course,
        }

        return render(request,'organization/org-detail-course.html',context)

    def post(self,request):
        pass


class OrgDescView(View):
    def get(self,request,org_id):
        course_org = CourseOrg.objects.get(id=org_id)

        context = {
            'course_org':course_org
        }
        return render(request,'organization/org-detail-desc.html',context)

    def post(self,request):
        pass


class OrgTeacherView(View):
    def get(self,request,org_id):
        course_org = CourseOrg.objects.get(id=org_id)
        all_teacher = course_org.teacher_set.all()
        course_org.click_nums +=1
        course_org.save()
        context = {
            'course_org':course_org,
            'all_teacher':all_teacher
        }
        return render(request,'organization/org-detail-teachers.html',context)

    def post(self,request):
        pass


class AddFavView(View):
    def get(self,request):
        pass

    def post(self,request):
        id = request.POST.get("fav_id",0) # 防止后边int(fav_id)出错
        type = request.POST.get("fav_type",0) # 防止后边int(fav_type)出错
        user = request.user
        if not user.is_authenticated:
            return JsonResponse({'status':"fail",'msg':"用户未登录"})
        exist_record = UserFavorite.objects.filter(fav_id=int(id),fav_type=int(type))
        if exist_record:
            # 说明已经有数据，需要取消收藏
            exist_record.delete()
            if int(type) == 1:
                course = Course.objects.get(id=int(id))
                course.fav_nums -= 1
                if course.fav_nums < 0:
                    course.fav_nums = 0
                course.save()
            elif int(type) == 2:
                org = CourseOrg.objects.get(id=int(id))
                org.fav_nums -= 1
                if org.fav_nums < 0:
                    org.fav_nums = 0
                org.save()
            elif int(type) == 3:
                teacher = Teacher.objects.get(id=int(id))
                teacher.fav_nums -= 1
                if teacher.fav_nums < 0:
                    teacher.fav_nums = 0
                teacher.save()
            return JsonResponse({"status":"success","msg":"收藏"})
        else:
            # 说明没有数据需要添加收藏数据
            user_fav = UserFavorite()
            if int(id) >0 and int(type)>0:
                user_fav.user = user
                user_fav.fav_id = id
                user_fav.fav_type = type
                user_fav.save()
                if int(type) == 1:
                    course = Course.objects.get(id=int(id))
                    course.fav_nums += 1
                    course.save()
                elif int(type) == 2:
                    org = CourseOrg.objects.get(id=int(id))
                    org.fav_nums += 1
                    org.save()
                elif int(type) == 3:
                    teacher = Teacher.objects.get(id=int(id))
                    teacher.fav_nums += 1
                    teacher.save()
                return JsonResponse({"status":"success",'msg':"已收藏"})
            else:
                return JsonResponse({"status":"fail","msg":"收藏出错"})


class TeacherListView(View):

    def get(self,request):
        all_teachers = Teacher.objects.all()
        page = request.GET.get('page','1')
        sort = request.GET.get("sort",'')
        if sort == 'hot':# 排序
            all_teachers = Teacher.objects.order_by('-click_nums')
        # 讲师排行帮
        sorted_teacher = Teacher.objects.order_by('-fav_nums')
        search_keywords = request.GET.get('keywords', '')
        if search_keywords:
            # 在name字段进行操作,做like语句的操作。i代表不区分大小写
            # or操作使用Q
            all_teachers = all_teachers.filter(name__icontains=search_keywords)

        # 进行分页
        teachers,page_li = process_page(int(page),all_teachers)
        context = {
            'teachers':teachers,
            'page_li':page_li,
            'hot':sort,
            'sorted_teacher':sorted_teacher,
            'search_keywords':search_keywords,
        }
        return render(request,'teacher/teachers-list.html',context)

    def post(self,request):
        pass


class TeacherDetailView(View):
    def get(self,request,teacher_id):
        teacher = Teacher.objects.get(id=teacher_id)
        all_course = Course.objects.filter(teacher=teacher)
        # 讲师排行帮
        sorted_teacher = Teacher.objects.order_by('-fav_nums')
        context = {
            'teacher':teacher,
            'all_course':all_course,
            'sorted_teacher': sorted_teacher,

        }
        return render(request,'teacher/teacher-detail.html',context)
    def post(self,request):
        pass

