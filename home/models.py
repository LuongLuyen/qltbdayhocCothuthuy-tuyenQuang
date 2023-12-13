from django.db import models

class User(models.Model): # bảng người dùng
  userName = models.CharField(max_length=255)
  password = models.CharField(max_length=255)
  name = models.CharField(max_length=255)
  role = models.CharField(max_length=10)

class Device(models.Model): # bảng thiết bị
  userId = models.ForeignKey(User, on_delete=models.CASCADE)
  name = models.CharField(max_length=1000)
  mon = models.CharField(max_length=255)
  code = models.CharField(max_length=255)
  unit = models.CharField(max_length=255)
  price = models.CharField(max_length=255)
  quantity = models.CharField(max_length=255)
  status = models.CharField(max_length=255)
  date = models.CharField(max_length=255)
  location = models.CharField(max_length=255)
  hansudung =models.CharField(max_length=255)


class BorrowReturn(models.Model): # bảng lịch sử
  userId = models.ForeignKey(User, on_delete=models.CASCADE)
  deviceId = models.ForeignKey(Device, on_delete=models.CASCADE)
  muon = models.CharField(max_length=255)
  tra = models.CharField(max_length=255)
  lop = models.CharField(max_length=255)
  giaovien = models.CharField(max_length=255)
  tiet = models.CharField(max_length=255)
