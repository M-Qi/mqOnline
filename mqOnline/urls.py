"""mqOnline URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path,include
from django.views.static import serve
from mqOnline.settings import MEDIA_ROOT,MEDIA_URL
from . import views
import xadmin

urlpatterns = [
    path('xadmin/', xadmin.site.urls),
    path('captcha/',include('captcha.urls')), # 注册验证码路由
    path('media/<path:path>',serve,
         {'document_root':MEDIA_ROOT}
         ),
    path('ueditor/',include('DjangoUeditor.urls')), # 注册富文本编辑器路由
    path('',views.index,name='index'),
    path('user/',include('users.urls',namespace='users')), # 注册用户路由
    path('org/',include('organization.urls',namespace='org')), # 注册机构&城市
    path("course/",include('course.urls',namespace='course')),
]
