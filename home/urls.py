from django.urls import path
from . import views

urlpatterns = [
    path('', views.getLogin, name='login'),
    path('home/', views.getHome, name='home'),
    path('register/', views.getRegister, name='register'),
    path('thongke/', views.getThongKe, name='thongke'),
    path('admins/', views.getAdmin, name='admins'),
    path('add/', views.getAdd, name='add'),
]