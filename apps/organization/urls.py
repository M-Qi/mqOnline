from django.urls import path
from . import views
app_name ='organization'


urlpatterns = [
    path('list/',views.OrgView.as_view(),name='org_list'),
    path("add_ask/",views.AddUserAskView.as_view(),name='add_ask'),
    path('home/<int:org_id>/',views.OrgHomeView.as_view(),name='org_home'),
    path('course/<int:org_id>/',views.OrgCourseView.as_view(),name='org_course'),
    path('desc/<int:org_id>/',views.OrgDescView.as_view(),name='org_desc'),
    path("teacher/<int:org_id>/",views.OrgTeacherView.as_view(),name='org_teacher'),
    path('add_fav/',views.AddFavView.as_view(),name='add_fav'),
    path("teacher/list/",views.TeacherListView.as_view(),name='teacher_list'),
    path("teacher/detail/<int:teacher_id>/",views.TeacherDetailView.as_view(),name='teacher_detail')
]

