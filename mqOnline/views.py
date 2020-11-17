from django.shortcuts import render
from course.models import Course
from organization.models import CourseOrg
from users.models import Banner

def index(request):
    # 主页轮播图
    all_banner = Banner.objects.order_by('index')
    # 课程轮播图
    courses_banner = Course.objects.filter(is_banner=True)[:3]
    # 首页展示课程
    all_course = Course.objects.filter(is_banner=False)[:6]
    # 首页机构
    course_orgs = CourseOrg.objects.all()[:15]

    context = {
        'all_banner':all_banner,
        'courses_banner':courses_banner,
        'all_course':all_course,
        'course_orgs':course_orgs
    }
    return render(request,'index.html',context)



from django.shortcuts import render_to_response
def pag_not_found(request,exception=None):
    # 全局404处理函数
    response = render_to_response('errors/404.html', {})
    response.status_code = 404
    return response



def pag_not_error(request,exception=None):
    # 全局404处理函数
    response = render_to_response('errors/500.html', {})
    response.status_code = 500
    return response

