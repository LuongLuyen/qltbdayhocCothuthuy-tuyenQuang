from django.shortcuts import render,redirect,get_object_or_404
from datetime import datetime,timedelta
import pytz
from django.http import HttpResponse
from openpyxl import Workbook


from .models import User, Device,BorrowReturn
from django.contrib.auth import logout
from .forms import UserForm,DeviceForm

def thongBao(request):
    id = request.session.get('id') #eeeeeeeeee
    thongbao = BorrowReturn.objects.select_related('deviceId','userId').filter(userId=id).order_by('-id')[0:5]
    listT = []
    for x in thongbao:
        if "-T" in x.giaovien:
            listT.append(x)
    return listT
def excel(list):
    workbook = Workbook()
    worksheet = workbook.active
    headers = ["ID","Tên thiết bị","Ngày mượn", "Ngày trả", "Giáo viên mượn cho lớp (-T là Đã trả  )", "Tiết(giờ hết tiết)","code","Đơn vị","Giá","Số lượng(mỗi lần)","Ngày nhập","Xuất sứ","Tên người dùng","role","Hạn sử dụng"] 
    for col_num, header in enumerate(headers, start=1):
        worksheet.cell(row=1, column=col_num, value=header)
    for row_num, device in enumerate(list, start=2):
        worksheet.cell(row=row_num, column=1, value=device.id)
        worksheet.cell(row=row_num, column=2, value=device.deviceId.name)
        worksheet.cell(row=row_num, column=3, value=device.muon)
        worksheet.cell(row=row_num, column=4, value=device.tra)
        worksheet.cell(row=row_num, column=5, value=device.giaovien +" mượn cho: " +device.lop)
        worksheet.cell(row=row_num, column=6, value=device.tiet)
        worksheet.cell(row=row_num, column=7, value=device.deviceId.code)
        worksheet.cell(row=row_num, column=8, value=device.deviceId.unit)
        worksheet.cell(row=row_num, column=9, value=device.deviceId.price)
        worksheet.cell(row=row_num, column=10, value=1)
        worksheet.cell(row=row_num, column=11, value=device.deviceId.date)
        worksheet.cell(row=row_num, column=12, value=device.deviceId.location)
        worksheet.cell(row=row_num, column=13, value=device.userId.name)
        worksheet.cell(row=row_num, column=14, value=device.userId.role)
        worksheet.cell(row=row_num, column=15, value=device.deviceId.hansudung)

    response = HttpResponse(content_type='application/vnd.openxmlformats-officedocument.spreadsheetml.sheet')
    response['Content-Disposition'] = 'attachment; filename=device_data.xlsx'
    workbook.save(response)
    return response

def excelHsd(list):
    workbook = Workbook()
    worksheet = workbook.active
    headers = ["ID","Tên thiết bị", "Môn","code","Đơn vị","Giá","Số lượng","Ngày nhập","Xuất sứ","Hạn sử dụng"] 
    for col_num, header in enumerate(headers, start=1):
        worksheet.cell(row=1, column=col_num, value=header)
    for row_num, device in enumerate(list, start=2):
        worksheet.cell(row=row_num, column=1, value=device.id)
        worksheet.cell(row=row_num, column=2, value=device.name)
        worksheet.cell(row=row_num, column=3, value=device.mon)
        worksheet.cell(row=row_num, column=4, value=device.code)
        worksheet.cell(row=row_num, column=5, value=device.unit)
        worksheet.cell(row=row_num, column=6, value=device.price)
        worksheet.cell(row=row_num, column=7, value=device.quantity)
        worksheet.cell(row=row_num, column=8, value=device.date)
        worksheet.cell(row=row_num, column=9, value=device.location)
        worksheet.cell(row=row_num, column=10, value=device.hansudung)

    response = HttpResponse(content_type='application/vnd.openxmlformats-officedocument.spreadsheetml.sheet')
    response['Content-Disposition'] = 'attachment; filename=user_data.xlsx'
    workbook.save(response)
    return response

def excelNd(list):
    workbook = Workbook()
    worksheet = workbook.active
    headers = ["ID","Tên", "Tài khoản","mật khẩu","role"] 
    for col_num, header in enumerate(headers, start=1):
        worksheet.cell(row=1, column=col_num, value=header)
    for row_num, device in enumerate(list, start=2):
        worksheet.cell(row=row_num, column=1, value=device.id)
        worksheet.cell(row=row_num, column=2, value=device.name)
        worksheet.cell(row=row_num, column=3, value=device.userName)
        worksheet.cell(row=row_num, column=4, value=device.password)
        worksheet.cell(row=row_num, column=5, value=device.role)
    response = HttpResponse(content_type='application/vnd.openxmlformats-officedocument.spreadsheetml.sheet')
    response['Content-Disposition'] = 'attachment; filename=hsd_data.xlsx'
    workbook.save(response)
    return response

def timeVietnam(dmy):
    if dmy == "dmy":
        vietnam = pytz.timezone('Asia/Ho_Chi_Minh')
        time = datetime.now(vietnam)
        return time.strftime('%Y-%m-%d')
    else:
        vietnam = pytz.timezone('Asia/Ho_Chi_Minh')
        time = datetime.now(vietnam)
        return time.strftime('%Y-%m-%d %H:%M:%S')

def checkHSD():
    list = Device.objects.all()
    device = []
    for x in list:
        if x.hansudung != "#":
            device.append(x)
    for x in device:
        dateNow =str(timeVietnam("dmy"))
        hsd= x.hansudung
        if(hsd < dateNow or hsd == dateNow):
            x.status = 'Hết hạn'
            x.save()
def checkLab():
    borrowReturn = BorrowReturn.objects.all()
    for x in borrowReturn:
        if "-T" in x.giaovien:
            non=0
        else:
            T= str(x.tra) + " "+ str(x.tiet)
            dateNow =str(timeVietnam("no"))
            if(T < dateNow or T == dateNow):
                device = Device.objects.get(id=x.deviceId_id)
                borrowReturn = BorrowReturn.objects.get(id=x.id)
                if device.unit == "phòng":
                    device.quantity=int(device.quantity) +1
                    device.save()
                    borrowReturn.giaovien = str(borrowReturn.giaovien)+"-T"
                    borrowReturn.save()

def getLogin(request):
    if request.method == 'POST':
        userName = request.POST.get('userName')
        password = request.POST.get('password')
        out = request.POST.get('out')
        device = Device.objects.all()
        if(out=="out"):
            if 'id' in request.session:
                del request.session['id']
                del request.session['name']
                request.session.pop('role', None)
            logout(request)
            return render(request, 'pages/Login.html')
        try:
            user = User.objects.get(userName=userName,password=password)
            request.session['id'] = str(user.id)
            request.session['role'] = str(user.role)
            request.session['name'] = str(user.name)
            checkHSD()
            checkLab()
        except:
            return render(request, 'pages/Login.html')
        rl = bool
        role = request.session.get('role') #eeeeeeeeee
        id = request.session.get('id') #eeeeeeeeee
        name = request.session.get('name') #eeeeeeeeee
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
        id = request.session.get('id') #eeeeeeeeee
        thongbao = BorrowReturn.objects.select_related('deviceId','userId').filter(userId=id).order_by('-id')[0:5]
        listT = []
        for x in thongbao:
            if "-T" in x.giaovien:
                listT.append(x)
        return render(request, 'pages/Home.html',{'device':listDevice,"role":rl,"name":name,"id":id, "device0":listDevice0,"thongbao":listT})
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
    name = request.session.get('name') #eeeeeeeeee
    id = request.session.get('id') #eeeeeeeeee
    if request.method == 'POST':
        deviceId = request.POST.get('deviceId')
        mon = request.POST.get('mon')
        search = request.POST.get('search')
        idUserClient = request.POST.get('idUser')
        print(idUserClient)
        if search != None and search != '':
            device = Device.objects.all()
            list = []
            for x in device:
                if search in x.name:
                    list.append(x)
                listT =thongBao(request)
            return render(request, 'pages/Home.html',{"device": list,"thongbao":listT,"id":id})
        rl = bool
        role = request.session.get('role') #eeeeeeeeee
        if role == "ADMIN":
            rl = True
        else:
            rl =False
        if deviceId!=None:
            device = Device.objects.get(id = deviceId)
            listT = thongBao(request)
            return render(request, 'pages/Borrowdevice.html',{"device": device,"thongbao":listT})
        if mon!="":
            device = Device.objects.filter(code = mon)
            listT = thongBao(request)
            return render(request, 'pages/Home.html',{"device": device,"thongbao":listT})
        
    rl = bool
    role = request.session.get('role') #eeeeeeeeee
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
    listT = thongBao(request)
    return render(request, 'pages/Home.html',{"device":listDevice,"role":rl,"name":name,"device0":listDevice0,"thongbao":listT})
def getThongKe(request):
    nameUser = request.session.get('name') #eeeeeeeeee
    rl = bool
    role = request.session.get('role') #eeeeeeeeee
    if role == "ADMIN":
        rl = True
    else:
        rl =False
    device = BorrowReturn.objects.select_related('deviceId','userId').all()
    sum =0
    for x in device:
        sum =sum+1
    if request.method == 'POST':
        mon = request.POST.get('mon')
        nam = request.POST.get('nam')
        e = request.POST.get('e')
        end = request.POST.get('end')
        ehsd = request.POST.get('ehsd')
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
               if mon in x.deviceId.code:
                   list.append(x)
            sum =0
            for x in list:
                sum =sum+1
            listT =thongBao(request)
            return render(request, 'pages/Thongke.html',{"device":list, "sum":sum,"name":nameUser,"role":rl,"thongbao":listT})
        if giaovien != None:
            list = []
            for x in device:
               if giaovien in x.giaovien:
                   list.append(x)
            sum =0
            for x in list:
                sum =sum+1
            listT =thongBao(request)
            return render(request, 'pages/Thongke.html',{"device":list, "sum":sum,"name":nameUser,"role":rl,"thongbao":listT})
        if nams != "" and name != "":
            r = BorrowReturn.objects.filter(muon__gte=f"{nams}-1-1", muon__lte=f"{name}-12-31")
            sum =0
            for x in r:
                sum =sum+1
            listT =thongBao(request)
            return render(request, 'pages/Thongke.html',{"device":r, "sum":sum,"name":nameUser,"role":rl, "thongbao":listT})
        if ngays != None and ngaye != None:
            r = BorrowReturn.objects.filter(muon__gte=f"{ngays}", muon__lte=f"{ngaye}")
            sum =0
            for x in r:
                sum =sum+1
            listT =thongBao(request)
            return render(request, 'pages/Thongke.html',{"device":r,"sum":sum,"name":nameUser,"role":rl,"thongbao":listT})
        if e != None:
            device = BorrowReturn.objects.select_related('deviceId','userId').all().order_by('id')
            file = excel(device)
            return file
        if end != None:
            user = User.objects.all().order_by('id')
            file = excelNd(user)
            return file
        if ehsd != None:
            device = Device.objects.all().order_by('id')
            listHsd = []
            for x in device:
                if x.hansudung != "#":
                    listHsd.append(x)
            file = excelHsd(listHsd)
            return file
    listT= thongBao(request)
    return render(request, 'pages/Thongke.html',{"device":device, "sum":sum,"name":nameUser ,"role":rl,"thongbao":listT})


def getAdmin(request):
    name = request.session.get('name') #eeeeeeeeee
    rl = bool
    role = request.session.get('role') #eeeeeeeeee
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
            listT =thongBao(request)
            return render(request, 'pages/Add.html',{"device":device, "role":rl,"name":name, "thongbao":listT})
    device = Device.objects.all()
    listT = thongBao(request)
    return render(request, 'pages/Admin.html',{"device":device,"role":rl,"name":name, "thongbao":listT})
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
    id = request.session.get('id') #eeeeeeeeee
    return render(request, 'pages/Add.html',{"id":id})

def getLab(request):
    name = request.session.get('name') #eeeeeeeeee
    if request.method == 'POST':
        deviceId = request.POST.get('deviceId')
        rl = bool
        role = request.session.get('role') #eeeeeeeeee
        if role == "ADMIN":
            rl = True
        else:
            rl =False
        if deviceId != None:
            device = Device.objects.get(id=deviceId)
            listT = thongBao(request)
            return render(request,'pages/Borrowlab.html',{"device": device})
       
    rl = bool
    role = request.session.get('role') #eeeeeeeeee
    if role == "ADMIN":
        rl = True
    else:
        rl =False
    device = Device.objects.all()
    listDevice1 =[]
    listDevice2 =[]
    listDevice3 =[]
    listDevice4 =[]
    listDeviceKt =[]
    listDevice0 =[]
    for x in device:
        if x.unit =="phòng" and x.quantity != "0":
            if "T1" in x.code :
                listDevice1.append(x)
            if "T2" in x.code :
                listDevice2.append(x)
            if "T3" in x.code :
                listDevice3.append(x)
            if "T4" in x.code :
                listDevice4.append(x)
            if "KT" in x.code :
                listDeviceKt.append(x)
        if x.unit =="phòng" and x.quantity == "0":
            listDevice0.append(x)
    listT = thongBao(request)
    return render(request, 'pages/Lab.html',{"device0":listDevice0,"device1":listDevice1,"device2":listDevice2,"device3":listDevice3,"device4":listDevice4,"deviceKt":listDeviceKt,"role":rl,"name":name,"tb":True,"thongbao":listT})

def getBorrowLab(request):
    if request.method == 'POST':
        giaovien = request.POST.get('giaovien')
        lop = request.POST.get('lop')
        ngaym = request.POST.get('ngaym')
        ngayt = request.POST.get('ngayt')
        tietm = request.POST.get('tietm')
        deviceId = request.POST.get('deviceId')
        id = request.session.get('id') #eeeeeeeeee
        if giaovien != "" and lop != "" and ngaym != "" and ngayt !="" and tietm != "" and deviceId != "" :
            borrowReturn = BorrowReturn(userId_id=int(id),deviceId_id=int(deviceId),muon=ngaym,tra=ngayt,lop=lop, giaovien =giaovien,tiet=tietm)
            device = Device.objects.get(id=deviceId)
            device.quantity = int(device.quantity)-1
            device.save()
            borrowReturn.save()
            return redirect('/thietbidangduocmuon')
        device = Device.objects.get(id = deviceId)
        listT = thongBao(request)
        return render(request, 'pages/BorrowLab.html',{"device": device,"thongbao":listT})
    listT = thongBao(request)
    return render(request, 'pages/BorrowLab.html',{"thongbao":listT})

def getBorrowDevice(request):
    if request.method == 'POST':
        giaovien = request.POST.get('giaovien')
        lop = request.POST.get('lop')
        ngaym = request.POST.get('ngaym')
        ngayt = request.POST.get('ngayt')
        tietm = request.POST.get('tietm')
        deviceId = request.POST.get('deviceId')
        id = request.session.get('id') #eeeeeeeeee
        if giaovien != "" and lop != "" and ngaym != "" and ngayt !="" and tietm != "" and deviceId != "" :
            borrowReturn = BorrowReturn(userId_id=int(id),deviceId_id=int(deviceId),muon=ngaym,tra=ngayt,lop=lop, giaovien =giaovien,tiet=tietm)
            device = Device.objects.get(id=deviceId)
            device.quantity = int(device.quantity)-1
            device.save()
            borrowReturn.save()
            return redirect('/thietbidangduocmuon')
        device = Device.objects.get(id = deviceId)
        listT = thongBao(request)
        return render(request, 'pages/Borrowdevice.html',{"device": device,"thongbao":listT})
    listT = thongBao(request)
    return render(request, 'pages/BorrowDevice.html',{"thongbao":listT})
def getThietBiDangDuocMuon(request):
    name = request.session.get('name') #eeeeeeeeee
    if request.method == 'POST':
        xoa = request.POST.get('xoa')
        idtra = request.POST.get('idtra')
        if xoa != None and idtra != None:
            device = Device.objects.get(id=xoa)
            device.quantity = int(device.quantity)+1
            device.save()
            borrowReturn = BorrowReturn.objects.get(id=idtra)
            borrowReturn.giaovien = str(borrowReturn.giaovien)+"-T"
            borrowReturn.save()
    idUser = request.session.get('id') #eeeeeeeeee
    device = BorrowReturn.objects.select_related('deviceId','userId').filter(userId=idUser)
    listm=[]
    listt=[]
    for x in device:
        if "-T" in x.giaovien:
            listt.append(x)
        else:
            listm.append(x)
    
    rl = bool
    role = request.session.get('role') #eeeeeeeeee
    if role == "ADMIN":
        rl = True
    else:
        rl =False
    listT = thongBao(request)
    return render(request, 'pages/Thietbidangduocmuon.html',{"device1": listm,"device2":listt,"role":rl,"name":name,"thongbao":listT})
def getBase(request):
    name = request.session.get('name') #eeeeeeeeee
    rl = bool
    role = request.session.get('role') #eeeeeeeeee
    if role == "ADMIN":
        rl = True
    else:
        rl =False
    return render(request, 'pages/Thongbao.html',{"role": rl,"name":name})

