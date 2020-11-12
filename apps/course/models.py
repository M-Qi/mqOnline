from datetime import datetime
from organization.models import CourseOrg,Teacher

from django.db import models

# Create your models here.

class Course(models.Model):
    '''课程表'''
    DEGREE_CHOICES = (
        ('cj','初级'),
        ('zj','中级'),
        ('gj','高级')
    )
    course_org = models.ForeignKey(CourseOrg,verbose_name='所属机构',on_delete=models.CASCADE,null=True,blank=True)
    name = models.CharField('课程名',max_length=50)
    desc = models.CharField('课程描述',max_length=300)
    detail = models.TextField('课程详细')
    degree = models.CharField('难度',choices=DEGREE_CHOICES,max_length=2)
    learn_times = models.IntegerField('学习时长(分钟数)',default=0)
    student_nums = models.IntegerField('学习人数',default=0)
    fav_nums = models.IntegerField('收藏人数',default=0)
    image = models.ImageField('封面图',upload_to='courses/%Y%m',max_length=100)
    click_nums = models.IntegerField('点击数量',default=0)
    add_times = models.DateTimeField('添加时间',default=datetime.now)
    category = models.CharField("课程类别",max_length=20,default='')
    tag = models.CharField("课程标签",default='',max_length=10)
    teacher = models.ForeignKey(Teacher,verbose_name='讲师',null=True,blank=True,on_delete=models.CASCADE)
    youneed_know = models.CharField("课程须知",max_length=200,default='')
    teacher_tell = models.CharField("老师告诉你",max_length=300,default='')

    class Meta:
        verbose_name = "课程"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name

    def get_zj_nums(self):
        '''获取课程的章节数'''
        return self.lesson_set.all().count()

    def get_learn_users(self):
        '''获取这门课程学习用户'''
        return self.usercourse_set.all()[:5]

    def get_lesson(self):
        '''获取当前课程章节信息'''
        return self.lesson_set.all()

class Lesson(models.Model):
    '''章节信息表'''
    course = models.ForeignKey(Course,verbose_name='课程',on_delete=models.CASCADE)
    name = models.CharField('章节名',max_length=100)
    add_time = models.DateTimeField('添加时间',default=datetime.now)

    class Meta:
        verbose_name = '章节'
        verbose_name_plural = verbose_name

    def __str__(self):
        return '《{0}》课程的章节 >> {1}'.format(self.course,self.name)

    def get_viedo(self):
        '''获取当前章节的视频'''
        return self.viedo_set.all()

class Viedo(models.Model):
    '''视频表'''
    lesson = models.ForeignKey(Lesson,verbose_name='章节',on_delete=models.CASCADE)
    name = models.CharField('视频名',max_length=100)
    add_time = models.DateTimeField('添加时间',default=datetime.now)
    url = models.CharField('访问地址', default='', max_length=200)
    learn_times = models.IntegerField('学习时长(分钟数)',default=0)

    class Meta:
        verbose_name='视频'
        verbose_name_plural=verbose_name


class CourseResourse(models.Model):
    '''课程资源'''
    course = models.ForeignKey(Course,verbose_name='课程',on_delete=models.CASCADE)
    name = models.CharField('名称',max_length=100)
    download = models.FileField('资源文件',upload_to='course/resourse/%Y/%m',max_length=100)
    add_time = models.DateTimeField('添加时间',default=datetime.now)

    class Meta:
        verbose_name='课程资源'
        verbose_name_plural=verbose_name


