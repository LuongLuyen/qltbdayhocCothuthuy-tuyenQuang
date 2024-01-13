from django.urls import path
from . import views

urlpatterns = [ 
    path('', views.loginController, name='login'),
    path('home/', views.homeController, name='home'),
    path('register/', views.registerController, name='register'),
    path('thongke/', views.thongkeController, name='thongke'),
    path('admins/', views.adminController, name='admins'),
    path('add/', views.addController, name='add'),
    path('lab/', views.labController, name='lab'),
    path('borrowlab/', views.borrowLabController, name='borrowlab'),
    path('borrowdevice/', views.borrowDeviceController, name='borrowdevice'),
    path('thietbidangduocmuon/', views.dangMuonController, name='thietbidangduocmuon'),
]