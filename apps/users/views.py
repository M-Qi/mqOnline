import random,json

from django.http import HttpResponse, JsonResponse

from course.models import Course
from operation.models import UserCourse, UserFavorite, UserMessage
from organization.models import CourseOrg, Teacher
from utils.mixin_utils import LoginRequireMixin
from utils.page_utils import process_page
from utils.email_send import send_register_email
from django.contrib.auth.hashers import make_password
from django.db.models import Q
from django.shortcuts import render, redirect
from django.urls import reverse
from django.contrib.auth.backends import ModelBackend
from django.views.generic.base import View
from users.models import UserProfile,EmailVerfyRecord
from .forms import LoginForm, RegisterForm, ForgetPwdForm, ModifyPwdForm,UploadImageForm,UserInfoForm
from django.contrib.auth import login,authenticate,logout



# Create your views here.
def user_logout(request):
    logout(request)

    return redirect(reverse('index'))
class LoginView(View):
    def get(self,request):
        forms = LoginForm()
        return render(request,'login.html',context={'forms':forms})

    def post(self,request):
        form = LoginForm(request.POST)

        if form.is_valid():
            username = form.cleaned_data.get('username')
            password = form.cleaned_data.get('password')

            user = authenticate(username=username,password=password)
            if user is None or user.is_active==False:
                return render(request,'login.html',context={'msg':"用户名或者密码错误",'forms':form})
            else:
                login(request,user)

                return redirect(reverse('index'))
        else:
            return render(request,'login.html',{'forms':form})



class CustomBackend(ModelBackend):
    def authenticate(self, request, username=None, password=None, **kwargs):
        try:
            # Q 是并集查询 要么username 要么email
            user = UserProfile.objects.get(Q(username=username)|Q(email=username))

            # 验证密码 不能使用password==password
            # 自带的User模型中有def check_password(self,raw_password)
            if user.check_password(password):
                return user
        except Exception as e:
            return None


class ActiveView(View):
    def get(self,request,code):

        email_record = EmailVerfyRecord.objects.filter(code=code)
        if email_record:
            for record in email_record:
                email = record.email
                user = UserProfile.objects.get(email=email)
                user.is_active = True
                user.save()
        else:
            return render(request,'active.fail.html')

        return redirect(reverse('users:login'))


class RegisterView(View):
    def get(self,request):
        reg_forms = RegisterForm()

        return render(request,'register.html',{'reg_forms':reg_forms})

    def post(self,request):
        form = RegisterForm(request.POST)
        # 校验数据
        if form.is_valid():
            # 获取数据
            email = request.POST.get('email')
            password = request.POST.get('password')
            # 查看是否存在用户

            if UserProfile.objects.filter(email=email) :
                return render(request,'register.html',{'reg_forms':form,'msg':"此用户已经注册"})

            # 准备数据，保存，实力化一个user对象
            user = UserProfile()
            user.username = email
            user.email = email
            user.is_active = False
            # 对保存的用户密码进行加密
            user.password = make_password(password)
            user.save()
            # 发送邮件进行激活
            send_register_email(email)

            return redirect(reverse('users:login'))
        else:
            return render(request,'register.html',{'reg_forms':form})



class ForgetPwdView(View):
    def get(self,request):
        forms = ForgetPwdForm()

        return render(request,'forgetpwd.html',{"forms":forms})

    def post(self,request):
        forms = ForgetPwdForm(request.POST)
        if forms.is_valid():
            email = request.POST.get('email')

            if UserProfile.objects.filter(email=email).exists():
                send_register_email(email,send_type='forget')
                return render(request,'send_success.html',{'msg':"发送成功"})
            else:
                return render(request,'forgetpwd.html',{'forms':forms,"msg":"此邮箱不存在"})
        else:
            return render(request,'forgetpwd.html',{"forms":forms})

class ResetView(View):
    def get(self, request, code):
        all_records = EmailVerfyRecord.objects.filter(code=code)
        if all_records:
            for record in all_records:
                email = record.email
                return render(request, "password_reset.html", {"email":email})
        else:
            return render(request, "active_fail.html")
        return render(request, "login.html")



class ModifyPwdView(View):

    def post(self,request):
        forms = ModifyPwdForm(request.POST)
        if forms.is_valid():
            pwd1 = request.POST.get('password1')
            pwd2 = request.POST.get('password2')
            email = request.POST.get('email')
            if pwd2 != pwd1:
                return render(request,'password_reset.html',{"msg":"两次输入密码不一致"})

            user = UserProfile.objects.get(email=email)
            user.password =make_password(pwd1)
            user.save()

            return redirect(reverse('users:login'))
        else:
            email = request.POST.get('email','')

            return render(request,'password_reset.html',{"forms":forms,'email':email})


class UserinfoView(LoginRequireMixin,View):

    def get(self,request):


        return render(request,'users/usercenter-info.html')

    def post(self,request):

        user_info_form = UserInfoForm(request.POST,instance=request.user)
        if user_info_form.is_valid():
            print('birth==',user_info_form.cleaned_data.get('birday'))
            user_info_form.save()

            return JsonResponse({"status":"success"})
        else:
            return JsonResponse(json.dumps(user_info_form.errors))

class UploadImageView(View):
    def get(self,request):
        pass

    def post(self,request):
        image_form = UploadImageForm(request.POST,request.FILES)
        if image_form.is_valid():
            image = image_form.cleaned_data.get('image')
            request.user.image = image
            request.user.save()
            return JsonResponse({"status":'success'})
        else:
            return JsonResponse({"status":"fail"})


class UpdatePwdView(View):
    def get(self,request):
        pass

    def post(self,request):

        modify_form = ModifyPwdForm(request.POST)
        if modify_form.is_valid():
            pwd1 = request.POST.get("password1",'')
            pwd2 = request.POST.get("password2",'')
            if pwd1 != pwd2:
                return JsonResponse({"status":"fail",'msg':"两次密码不一致"})
            user = request.user
            user.password = make_password(pwd1)
            user.save()
            return JsonResponse({"status":"success"})
        else:
            return JsonResponse(json.dumps(modify_form.errors))


class SendEmailCodeView(View):
    def get(self,request):
        email = request.GET.get("email",'')
        if UserProfile.objects.filter(email=email):
            return JsonResponse({"email":"邮箱已经存在"})
        send_register_email(email,'update_email')
        return JsonResponse({"status":"success"})

    def post(self,request):
        pass


class UpdateEmailView(View):
    def get(self,request):
        pass

    def post(self,request):
        email = request.POST.get("email",'')
        code = request.POST.get('code','')

        existed_records = EmailVerfyRecord.objects.filter(code=code,send_type='update_email',email=email)
        if existed_records:
            user = request.user
            user.email = email
            user.save()
            return JsonResponse({"status":"success"})
        else:
            return JsonResponse({"status":"fail"})


class MyCourseView(LoginRequireMixin,View):
    def get(self,request):
        user_courses = UserCourse.objects.filter(user=request.user)
        context = {
            'user_courses':user_courses
        }
        return render(request,'users/usercenter-mycourse.html',context)

    def post(self,request):
        pass


class MyFavOrgView(LoginRequireMixin,View):
    '''我收藏的机构'''
    def get(self,request):
        org_list = []
        fav_orgs = UserFavorite.objects.filter(user=request.user,fav_type=2)
        for fav_org in fav_orgs:

            org_list.append(CourseOrg.objects.get(id=fav_org.fav_id))

        context = {
            'org_list':org_list
        }
        return render(request,'users/usercenter-fav-org.html',context)



    def post(self,request):
        pass


class MyFavTeacher(View):
    def get(self, request):
        teacher_list = []
        fav_teachers = UserFavorite.objects.filter(user=request.user, fav_type=3)
        for fav_teacher in fav_teachers:
            teacher_id = fav_teacher.fav_id
            teacher = Teacher.objects.get(id=teacher_id)
            teacher_list.append(teacher)
        return render(request, "users/usercenter-fav-teacher.html", {
            "teacher_list": teacher_list,
        })

    def post(self,request):
        pass


class MyFavCourse(LoginRequireMixin,View):
    def get(self,request):
        course_list=[]
        fav_courses = UserFavorite.objects.filter(user=request.user,fav_type=1)
        for fav_course in fav_courses:
            course_list.append(Course.objects.get(id=fav_course.fav_id))

        context = {
            'course_list':course_list
        }
        return render(request,'users/usercenter-fav-course.html',context)

    def post(self,request):
        pass


class MyMessageView(View):
    '''我的消息'''
    def get(sel,request):
        page = request.GET.get("page",'1')
        page = int(page)
        all_message = UserMessage.objects.filter(user=request.user.id)
        page_obj,page_li = process_page(page,all_message)

        context = {
            'all_messages':page_obj,
            'page_li':page_li
        }
        return render(request,'users/usercenter-message.html',context)
    def post(self,request):
        pass
