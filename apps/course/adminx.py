import xadmin
from .models import Course,Viedo,Lesson,CourseResourse,BannerCourse
# Register your models here.

class LessonInline(object):
    model = Lesson
    extra = 0

class CourseResourceInline(object):
    model = CourseResourse
    extra = 0


class CourseAdmin(object):
    '''课程'''
    list_display = ['name','desc','detail','degree','learn_times','student_nums','get_zj_nums','go_to']    # 展示哪个字段
    search_fields = ['name', 'desc', 'detail', 'degree'] # 搜索
    list_filter = ['name', 'desc', 'detail', 'degree', 'learn_times' ] # 过滤
    model_icon = 'fa fa-book'   # 图标
    ordering = ['-click_nums']   # 排序
    readonly_fields = ['click_nums']    # 只读字段 不能编辑
    exclude = ['fav_nums']  # 不显示的字段

    inlines = [LessonInline,CourseResourceInline]
    def queryset(self):
        # 重载queryset方法，来过滤我们想要的数据
        qs = super(CourseAdmin, self).queryset()
        # 只显示不是banner=false的
        qs = qs.filter(is_banner=False)
        return qs

    def save_models(self):
        # 在保存课程的时候统计课程机构的课程数量
        # obj实际上是一个course对象
        obj = self.new_obj
        obj.save()
        # 确定课程机构存在
        if obj.course_org is not None:
            # 扎到添加的课程的课程机构
            course_org = obj.course_org
            # 课程机构的课程数量等于添加课程后的数量
            course_org.course_nums = Course.objects.filter(course_org=course_org).count()
            course_org.save()




class BannerCourseAdmin(object):
    '''轮播课程'''
    list_display = ['name','desc','detail','degree','learn_times','student_nums']
    search_fields = ['name', 'desc', 'detail', 'degree']
    list_filter = ['name', 'desc', 'detail', 'degree', 'learn_times']
    model_icon = 'fa fa-book'   # 图标
    ordering = ['-click_nums']   # 排序
    readonly_fields = ['click_nums']    # 只读字段 不能编辑
    exclude = ['fav_nums']  # 不显示的字段

    inlines = [LessonInline,CourseResourceInline]

    def queryset(self):
        # 重载queryset方法，来过滤我们想要的数据
        qs = super(BannerCourseAdmin, self).queryset()
        # 过滤出是banner的
        qs = qs.filter(is_banner=True)
        return qs


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
xadmin.site.register(BannerCourse,BannerCourseAdmin)
xadmin.site.register(CourseResourse,CourseResourseAdmin)
xadmin.site.register(Viedo,ViedoAdmin)
xadmin.site.register(Lesson,LessonAdmin)


