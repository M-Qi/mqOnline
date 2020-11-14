from django.urls import path
from .views import LoginView,RegisterView,ActiveView,ForgetPwdView,ModifyPwdView,ResetView,user_logout
from . import views
app_name = 'users'


urlpatterns = [
    path('login/',LoginView.as_view(),name='login'),
    path('register/',RegisterView.as_view(),name='register'),
    path('active/<path:code>/',ActiveView.as_view(),name='active'),
    path('forget/',ForgetPwdView.as_view(),name='forget'),
    path('reset/<path:code>/',ResetView.as_view(),name='reset'),
    path('modify_pwd/',ModifyPwdView.as_view(),name='modify_pwd'),
    path("logout/",user_logout,name='logout'),
    path("info/",views.UserinfoView.as_view(),name='user_info'),
    path("image/upload/",views.UploadImageView.as_view(),name='image_upload'),
    path("update/pwd/",views.UpdatePwdView.as_view(),name='update_pwd'),
    path("send_email_code/",views.SendEmailCodeView.as_view(),name='send_email_coe')

]

