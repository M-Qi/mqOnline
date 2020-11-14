# 导包遵循 PEP8规范
# 第一区域先导自带的
from datetime import datetime

# 第二区域导第三方包
from django.contrib.auth.models import AbstractUser
from django.db import models
from DjangoUeditor.models import UEditorField
# Create your models here.


class UserProfile(AbstractUser):
    '''拓展用户模型：在原有的user模型上添加新字段'''
    gender_choices = (
        ('male','男'),
        ('female','女')
    )
    nick_name = models.CharField('昵称',max_length=50,default='')
    birthday = models.DateField('生日',null=True,blank=True)
    gender = models.CharField('性别',max_length=10,choices=gender_choices,default='female')
    address = UEditorField('地址',max_length=100,default='')
    mobile = models.CharField('手机号',max_length=11,null=True,blank=True)
    image = models.ImageField(verbose_name='头像',upload_to='image/%Y%m',default='image/default.png',max_length=100)

    class Meta:
        verbose_name = '用户信息'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.username

class EmailVerfyRecord(models.Model):
    '''验证码模型'''

    send_choices = (
     ('register','注册'),
     ('forget','找回密码'),
     ('update_email','修改邮箱')
    )

    code = models.CharField('验证码',max_length=20)
    email = models.EmailField('邮箱',max_length=50)
    send_type = models.CharField(choices=send_choices,max_length=10)
    send_time = models.DateTimeField(default=datetime.now)

    class Meta:
     verbose_name = '邮箱验证码'
     verbose_name_plural = verbose_name



class Banner(models.Model):
    '''轮播图模型'''
    title = models.CharField('标题',max_length=100)
    image = models.ImageField('轮播图',upload_to='banner/%Y%m',max_length=100)
    url = models.URLField('访问地址',max_length=200)
    index = models.IntegerField('顺序',default=100) # 控制顺序的字段
    add_time = models.DateTimeField('添加时间',default=datetime.now)

    class Meta:
        verbose_name = '轮播图'
        verbose_name_plural = verbose_name



