from django.urls import path
from . import views

urlpatterns = [ # các điều hướng trang
    path('', views.getLogin, name='login'),
    path('home/', views.getHome, name='home'),
    path('register/', views.getRegister, name='register'),
    path('thongke/', views.getThongKe, name='thongke'),
    path('admins/', views.getAdmin, name='admins'),
    path('add/', views.getAdd, name='add'),
    path('lab/', views.getLab, name='lab'),
    path('borrowlab/', views.getBorrowLab, name='borrowlab'),
    path('borrowdevice/', views.getBorrowDevice, name='borrowdevice'),
    path('thietbidangduocmuon/', views.getThietBiDangDuocMuon, name='thietbidangduocmuon'),
]