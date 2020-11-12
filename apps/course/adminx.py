import xadmin
from .models import Course,Viedo,Lesson,CourseResourse
# Register your models here.

class CourseAdmin(object):
    '''课程'''
    list_display = ['name','desc','detail','degree','learn_times','student_nums']
    search_fields = ['name', 'desc', 'detail', 'degree']
    list_filter = ['name', 'desc', 'detail', 'degree', 'learn_times' ]

class LessonAdmin(object):
    '''章节'''
    list_display = ['course','name','add_time']
    list_editable = ['name']

class ViedoAdmin(object):
    '''视频'''
    list_display = ['name','add_time','learn_times']
    list_editable = ['learn_times']

class CourseResourseAdmin(object):
    '''课程资源'''
    list_display = ['name','download']

xadmin.site.register(Course,CourseAdmin)
xadmin.site.register(CourseResourse,CourseResourseAdmin)
xadmin.site.register(Viedo,ViedoAdmin)
xadmin.site.register(Lesson,LessonAdmin)

