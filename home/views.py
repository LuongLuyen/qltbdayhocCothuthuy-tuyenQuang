from django.shortcuts import render,redirect,get_object_or_404
from datetime import datetime,timedelta
import pytz
from django.http import HttpResponse
from openpyxl import Workbook


from .models import User, Device,BorrowReturn
from django.contrib.auth import logout
from .forms import UserForm,DeviceForm

def excel(list):
    workbook = Workbook()
    worksheet = workbook.active
    headers = ["ID","mượn", "trả", "vị trí", "tiết","tên thiết bị","code","unit","price","quantity","date","xuất sứ","tên người dùng","role"] 
    for col_num, header in enumerate(headers, start=1):
        worksheet.cell(row=1, column=col_num, value=header)
    for row_num, device in enumerate(list, start=2):
        worksheet.cell(row=row_num, column=1, value=device.id)
        worksheet.cell(row=row_num, column=2, value=device.muon)
        worksheet.cell(row=row_num, column=3, value=device.tra)
        worksheet.cell(row=row_num, column=4, value=device.lop)
        worksheet.cell(row=row_num, column=5, value=device.tiet)
        worksheet.cell(row=row_num, column=6, value=device.deviceId.name)
        worksheet.cell(row=row_num, column=7, value=device.deviceId.code)
        worksheet.cell(row=row_num, column=8, value=device.deviceId.unit)
        worksheet.cell(row=row_num, column=9, value=device.deviceId.price)
        worksheet.cell(row=row_num, column=10, value=device.deviceId.quantity)
        worksheet.cell(row=row_num, column=11, value=device.deviceId.date)
        worksheet.cell(row=row_num, column=12, value=device.deviceId.location)
        worksheet.cell(row=row_num, column=13, value=device.userId.userName)
        worksheet.cell(row=row_num, column=14, value=device.userId.role)

    response = HttpResponse(content_type='application/vnd.openxmlformats-officedocument.spreadsheetml.sheet')
    response['Content-Disposition'] = 'attachment; filename=device_data.xlsx'

    workbook.save(response)

    return response

def timeVietnam(tiet):
    vietnam = pytz.timezone('Asia/Ho_Chi_Minh')
    time = datetime.now(vietnam) + timedelta(minutes=45*tiet)
    return time.strftime('%Y-%m-%d %H:%M:%S')

def getLogin(request):
    if request.method == 'POST':
        userName = request.POST.get('userName')
        password = request.POST.get('password')
        out = request.POST.get('out')
        device = Device.objects.all()
        try:
            user = User.objects.get(userName=userName,password=password)
            request.session['id'] = str(user.id)
            request.session['role'] = str(user.role)
            request.session['name'] = str(user.userName)
        except:
            return render(request, 'pages/Login.html')
        if(out=="out"):
            if 'id' in request.session:
                del request.session['id']
                del request.session['name']
                request.session.pop('role', None)
            logout(request)
            return render(request, 'pages/Login.html')
        rl = bool
        role = request.session.get('role')
        name = request.session.get('name')
        if role == "ADMIN":
            rl = True
        else:
            rl =False
        listDevice =[]
        listDevice0 =[]
        for x in device:
            if x.unit !="phòng" and x.quantity != "0":
                listDevice.append(x)
            if x.unit !="phòng" and x.quantity == "0":
                listDevice0.append(x)
        return render(request, 'pages/Home.html',{'device':listDevice,"role":rl,"name":name, "device0":listDevice0,"tb":True})
    return render(request, 'pages/Login.html')

def getRegister(request):
    if request.method == 'POST':
        form = UserForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('/')
    else:
        form = UserForm()
    return render(request, 'pages/Register.html', {'form': form})

def getHome(request):
    name = request.session.get('name')
    if request.method == 'POST':
        tb = request.POST.get('tb')
        myInput = request.POST.get('myInput')
        tiet = request.POST.get('tiet') # 5s = tiet
        lop = request.POST.get('lop')
        deviceId = request.POST.get('deviceId')
        id = request.session.get('id')
        rl = bool
        role = request.session.get('role')
        if role == "ADMIN":
            rl = True
        else:
            rl =False
        if myInput != None:

            ID = request.session.get('deviceId')
            try:
                device = Device.objects.get(id=int(ID))
                quantityInt = int(device.quantity) +1
                device.quantity =str(quantityInt)
                device.save()
                del request.session['deviceId']
            except:
                device = Device.objects.all()
                listDevice =[]
                listDevice0 =[]
                for x in device:
                    if x.unit !="phòng" and x.quantity != "0":
                        listDevice.append(x)
                    if x.unit !="phòng" and x.quantity == "0":
                        listDevice0.append(x)
                return render(request, 'pages/Home.html',{"device":listDevice,"device0":listDevice0,"role":rl, "name":name,"tb":True})
        if tb!=None:
            request.session['deviceId'] = str(deviceId)
            ID = request.session.get('deviceId')
            borrowReturn = BorrowReturn(userId_id=int(id),deviceId_id=int(ID),muon=timeVietnam(0),tra=timeVietnam(int(tiet)),lop=lop +"-"+str(Device.objects.get(id=ID).code),tiet=tiet)
            borrowReturn.save()
            device = Device.objects.get(id=int(ID))
            quantityInt = int(device.quantity) -1
            device.quantity =str(quantityInt)
            device.save()
            device = Device.objects.all()
            listDevice =[]
            listDevice0 =[]
            for x in device:
                if x.unit !="phòng" and x.quantity != "0":
                    listDevice.append(x)
                if x.unit !="phòng" and x.quantity == "0":
                    listDevice0.append(x)
            return render(request, 'pages/Home.html',{"time":int(tiet)*5, "id":id,"role":rl, "device":listDevice,"name":name,"device0":listDevice0,"tb":False})
    rl = bool
    role = request.session.get('role')
    if role == "ADMIN":
        rl = True
    else:
        rl =False
    device = Device.objects.all()
    listDevice =[]
    listDevice0 =[]
    for x in device:
        if x.unit !="phòng" and x.quantity != "0":
            listDevice.append(x)
        if x.unit !="phòng" and x.quantity == "0":
            listDevice0.append(x)
    return render(request, 'pages/Home.html',{"device":listDevice,"role":rl,"name":name,"device0":listDevice0,"tb":True})
def getThongKe(request):
    name = request.session.get('name')
    rl = bool
    role = request.session.get('role')
    if role == "ADMIN":
        rl = True
    else:
        rl =False
    device = BorrowReturn.objects.select_related('deviceId','userId').all()
    sum =0
    for x in device:
        sum += int(x.tiet)
    if request.method == 'POST':
        mon = request.POST.get('mon')
        nam = request.POST.get('nam')
        e = request.POST.get('e')
        name = "" 
        nams = ""
        if nam != None:
            nams = nam[0:4]
            name = nam[5:10]
        ngays = request.POST.get('ngays')
        ngaye = request.POST.get('ngaye')
        giaovien = request.POST.get('giaovien')
        if mon != None:
            list = []
            for x in device:
               if mon in x.lop:
                   list.append(x)
            sum =0
            for x in list:
                sum += int(x.tiet)
            return render(request, 'pages/Thongke.html',{"device":list, "sum":sum,"name":name,"role":rl})
        if giaovien != None:
            list = []
            for x in device:
               if giaovien in x.lop:
                   list.append(x)
            sum =0
            for x in list:
                sum += int(x.tiet)
            return render(request, 'pages/Thongke.html',{"device":list, "sum":sum,"name":name,"role":rl})
        if nams != "" and name != "":
            r = BorrowReturn.objects.filter(muon__gte=f"{nams}-1-1", muon__lte=f"{name}-12-31")
            sum =0
            for x in r:
                sum += int(x.tiet)
            return render(request, 'pages/Thongke.html',{"device":r, "sum":sum,"name":name,"role":rl})
        if ngays != None and ngaye != None:
            r = BorrowReturn.objects.filter(muon__gte=f"{ngays}", muon__lte=f"{ngaye}")
            sum =0
            for x in r:
                sum += int(x.tiet)
            return render(request, 'pages/Thongke.html',{"device":r,"sum":sum,"name":name,"role":rl})
        if e != None:
            device = BorrowReturn.objects.select_related('deviceId','userId').all().order_by('id')
            file = excel(device)
            return file
    return render(request, 'pages/Thongke.html',{"device":device, "sum":sum,"name":name,"role":rl})


def getAdmin(request):
    name = request.session.get('name')
    rl = bool
    role = request.session.get('role')
    if role == "ADMIN":
        rl = True
    else:
        rl =False
    if request.method == 'POST':
        xoa = request.POST.get('xoa')
        capnhat = request.POST.get('capnhat')
        if(xoa!=None):
            device = get_object_or_404(Device, pk=xoa)
            device.delete()
            return redirect('/admins')
        if capnhat != None:
            device = Device.objects.get(id =capnhat)
            return render(request, 'pages/Add.html',{"device":device, "role":rl,"name":name})
    device = Device.objects.all()
    return render(request, 'pages/Admin.html',{"device":device,"role":rl,"name":name})
def getAdd(request):
    if request.method == 'POST':
        form = DeviceForm(request.POST)
        update = request.POST.get('capnhat')
        if(update!=None):
            device = get_object_or_404(Device, pk=update)
            form = DeviceForm(request.POST, instance=device)
            if form.is_valid():
                form.save()
                return redirect('/admins')
        if form.is_valid():
            form.save()
            return redirect('/admins')
    id = request.session.get('id')
    return render(request, 'pages/Add.html',{"id":id})

def getLab(request):
    name = request.session.get('name')
    if request.method == 'POST':
        tb = request.POST.get('tb')
        myInput = request.POST.get('myInput')
        tiet = request.POST.get('tiet') # 5s = tiet
        lop = request.POST.get('lop')
        deviceId = request.POST.get('deviceId')
        id = request.session.get('id')
        rl = bool
        role = request.session.get('role')
        if role == "ADMIN":
            rl = True
        else:
            rl =False
        if myInput != None:

            ID = request.session.get('deviceId')
            try:
                device = Device.objects.get(id=int(ID))
                quantityInt = int(device.quantity) +1
                device.quantity =str(quantityInt)
                device.save()
                del request.session['deviceId']
            except:
                device = Device.objects.all()
                listDevice =[]
                listDevice0 =[]
                for x in device:
                    if x.unit =="phòng" and x.quantity != "0":
                        listDevice.append(x)
                    if x.unit =="phòng" and x.quantity == "0":
                        listDevice0.append(x)
                return render(request, 'pages/Lab.html',{"device":listDevice,"device0":listDevice0,"role":rl,"name":name,"tb":True})
        if tb!=None:
            request.session['deviceId'] = str(deviceId)
            ID = request.session.get('deviceId')
            borrowReturn = BorrowReturn(userId_id=int(id),deviceId_id=int(ID),muon=timeVietnam(0),tra=timeVietnam(int(tiet)),lop=lop +"-"+str(Device.objects.get(id=ID).code),tiet=tiet)
            borrowReturn.save()
            device = Device.objects.get(id=int(ID))
            quantityInt = int(device.quantity) -1
            device.quantity =str(quantityInt)
            device.save()
            device = Device.objects.all()
            listDevice =[]
            listDevice0 =[]
            for x in device:
                if x.unit =="phòng" and x.quantity != "0":
                    listDevice.append(x)
                if x.unit =="phòng" and x.quantity == "0":
                    listDevice0.append(x)
            return render(request, 'pages/Lab.html',{"time":int(tiet)*5, "id":id,"role":rl, "device":listDevice,"name":name,"device0":listDevice0,"tb":False})
    rl = bool
    role = request.session.get('role')
    if role == "ADMIN":
        rl = True
    else:
        rl =False
    device = Device.objects.all()
    listDevice =[]
    listDevice0 =[]
    for x in device:
        if x.unit =="phòng" and x.quantity != "0":
            listDevice.append(x)
        if x.unit =="phòng" and x.quantity == "0":
            listDevice0.append(x)
    return render(request, 'pages/Lab.html',{"device":listDevice,"role":rl,"name":name,"device0":listDevice0,"tb":True})
