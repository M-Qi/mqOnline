import xadmin
from xadmin import views
from .models import UserProfile,Banner,EmailVerfyRecord


class BaseSetting(object):
    enable_themes = True
    use_bootswatch = True



class GlobalSettings(object):
    '''
        设置网站标题和页脚
    '''
    site_title = '在线教育后台管理系统'
    site_footer = 'Powerd By 1906c - 2020'
    menu_style = 'accordion'

class UserProfileAdmin(object):

    # 只显示某个字段
    list_display = ['username','gender','mobile','address']
    # 过滤器
    list_filter = ['username']
    # 搜索条件
    search_fields = ['username','gender']
    # 图标
    model_icon = 'fa fa-bars'
    # 富文本字段
    style_fields = {'address':"ueditor"}
    # 排序
    ordering = ['date_joined']
    # 不显示某些字段
    exclude = ['date_joined']
    # 只读字段
    readonly_fields = ['nick_name']
    # 在首页可编辑字段
    list_editable= ['mobile']
    # 定时刷新
    refresh_times = [3,5]


class BannerAdmin(object):
    # 显示的列
    list_display = ['title','image','url','index','add_time']
    # 搜索条件
    search_fields = ['title','image','url','index']
    # 过滤器
    filter_fields = ['title','image','url','index']
    model_icon = 'fa fa-gift'

class EmailVerfyRecordAdmin(object):
    # 显示的列
    list_display = ['code','email','send_type']

    model_icon = 'fa fa-envelope-o'



# 先卸载   后注册防止报错
xadmin.site.unregister(UserProfile)

xadmin.site.register(UserProfile,UserProfileAdmin)
xadmin.site.register(Banner,BannerAdmin)
xadmin.site.register(EmailVerfyRecord,EmailVerfyRecordAdmin)
xadmin.site.register(views.BaseAdminView,BaseSetting)
xadmin.site.register(views.CommAdminView,GlobalSettings)






