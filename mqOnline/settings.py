"""
Django settings for mqOnline project.

Generated by 'django-admin startproject' using Django 2.2.16.

For more information on this file, see
https://docs.djangoproject.com/en/2.2/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/2.2/ref/settings/
"""

import os,sys

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
# 配置apps路
sys.path.insert(0,BASE_DIR)
sys.path.insert(0,os.path.join(BASE_DIR,'apps'))
# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/2.2/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'jp=y@41s3=sx)jo%b&r*3h-nse4@-lz7bmh=n6)uk(2ii+n5u-'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = []


# Application definition

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'xadmin' , # xadmin
    'crispy_forms' ,
    'reversion' ,
    'captcha', # 验证码app
    'users',
    'course',
    'organization',
    'operation',
    'DjangoUeditor', # 富文本编辑器
]



MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = 'mqOnline.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [os.path.join(BASE_DIR, 'templates')]
        ,
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
                #添加图片处理器，为了在课程列表中前面加上MEDIA_URL
                'django.template.context_processors.media',
            ],
        },
    },
]

WSGI_APPLICATION = 'mqOnline.wsgi.application'


# Database
# https://docs.djangoproject.com/en/2.2/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME':'mq_online',
        'USER':"root",
        'PASSWORD':"maqi123",
        'HOST': '127.0.0.1',    #IP
        'PORT': 3306,
    }
}


# Password validation
# https://docs.djangoproject.com/en/2.2/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/2.2/topics/i18n/

LANGUAGE_CODE = 'zh-hans'

TIME_ZONE = 'Asia/Shanghai'

USE_I18N = True

USE_L10N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/2.2/howto/static-files/

STATIC_URL = '/static/'
# STATIC_ROOT = 'static'

STATICFILES_DIRS = [
    os.path.join(BASE_DIR,'static')
]


# 重载AUTH_USER_MODEL
AUTH_USER_MODEL = 'users.UserProfile'

# 设置上传文件的路径
MEDIA_URL = '/media/'
MEDIA_ROOT = os.path.join(BASE_DIR,'media')

AUTHENTICATION_BACKENDS = (
    'users.views.CustomBackend',# 配置用户名和邮箱都可以登陆
)

EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend' # 引擎
EMAIL_HOST = 'smtp.163.com'  # smtp服务器
EMAIL_PORT = 25  # smtp端口
EMAIL_HOST_USER = '18295903413@163.com'  # 发送的邮箱
EMAIL_HOST_PASSWORD = 'WRGFIYGHAJEJIWPR'  # 163客户端授权码
EMAIL_FROM = 'python<18295903413@qq.com>'  # 收件人看到的发件人信息


# 自定义404，500等页面



