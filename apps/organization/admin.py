from .models import CourseOrg,CityDict,Teacher
import xadmin
# Register your models here.
class CourseOrgAdmin(object):
    list_display = ('name','desc','click_nums','fav_nums','category','address','city','add_time')
    readonly_fields = ['add_time']


class TeacherAdmin(object):
    list_display = ('name','org','work_years','work_company','work_position','points','fav_nums')
    readonly_fields = ['add_time']

class CityDictAdmin(object):
    list_display = ('name','desc','add_time')
    readonly_fields = ['add_time']



xadmin.site.register(CourseOrg,CourseOrgAdmin)
xadmin.site.register(Teacher,TeacherAdmin)
xadmin.site.register(CityDict,CityDictAdmin)