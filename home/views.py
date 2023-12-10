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
    headers = ["ID","Tên thiết bị","Ngày mượn", "Giáo viên mượn cho lớp (-T là Đã trả  )", "Tiết","code","Đơn vị","Giá","Số lượng(mỗi lần)","Ngày nhập","Xuất sứ","Tên người dùng","role","Hạn sử dụng"] 
    for col_num, header in enumerate(headers, start=1):
        worksheet.cell(row=1, column=col_num, value=header)
    for row_num, device in enumerate(list, start=2):
        worksheet.cell(row=row_num, column=1, value=device.id)
        worksheet.cell(row=row_num, column=2, value=device.deviceId.name)
        worksheet.cell(row=row_num, column=3, value=device.muon)
        worksheet.cell(row=row_num, column=4, value=device.giaovien +" mượn cho: " +device.lop)
        worksheet.cell(row=row_num, column=5, value=device.tiet)
        worksheet.cell(row=row_num, column=6, value=device.deviceId.code)
        worksheet.cell(row=row_num, column=7, value=device.deviceId.unit)
        worksheet.cell(row=row_num, column=8, value=device.deviceId.price)
        worksheet.cell(row=row_num, column=9, value=1)
        worksheet.cell(row=row_num, column=10, value=device.deviceId.date)
        worksheet.cell(row=row_num, column=11, value=device.deviceId.location)
        worksheet.cell(row=row_num, column=12, value=device.userId.name)
        worksheet.cell(row=row_num, column=13, value=device.userId.role)
        worksheet.cell(row=row_num, column=14, value=device.deviceId.hansudung)

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
# def checkLab():
#     borrowReturn = BorrowReturn.objects.all()
#     for x in borrowReturn:
#         if "-" in x.giaovien and x.deviceId.unit == "phòng":
#             if "-T" in x.giaovien:
#                non=0
#             else:
#                x.giaovien = x.giaovien +"T"
#                x.save()
#                device = Device.objects.get(id=x.deviceId.id)
#                device.quantity= int(device.quantity)+1
#                device.save()

def checkGioMuon():
    borrowReturn = BorrowReturn.objects.all()
    listls=[]
    for x in borrowReturn:
        if "-" in x.giaovien:
            non=0
        else:
            # dateNow =str(timeVietnam("dmy")) #lấy giờ thực tế
            dateNow = "2023-12-14" # check theo test
            if dateNow in x.muon:
                listls.append(x)
    for x in listls:
        input_time_string = x.tiet
        input_time = datetime.strptime(input_time_string, "%H:%M:%S")
        result_time = input_time - timedelta(minutes=45)
        result_time_string = result_time.strftime("%H:%M:%S")
        T= str(x.muon) + " "+ result_time_string #2023-11-30 07:15:00 -> 2023-11-30 08:00:00
        dateNow =str(timeVietnam("no"))
        dateNow = "2023-12-14 09:20:00" # check theo test
        if T== dateNow or dateNow>T or dateNow< x.tiet:
            device = Device.objects.get(id=x.deviceId_id)
            mt= BorrowReturn.objects.get(id=x.id)
            mt.giaovien = mt.giaovien + "-"
            mt.save()
            # if int(device.quantity) > 0:
            device.quantity=int(device.quantity) -1
            device.save()


def checkSLM(deviceId,tietm,ngaym):
    dateNow = ngaym
    device =Device.objects.get(id=deviceId)
    mt =BorrowReturn.objects.filter(deviceId=deviceId)
    slDaMuon =0
    slk = int(device.quantity)
    for x in mt:
        if "-" in x.giaovien:
            non=0
        else:
            if dateNow in x.muon:
               if tietm in x.tiet:
                   slDaMuon=slDaMuon+1
    if slk > slDaMuon:
        return True
    else:
        return False
    
def giosangtiet(list):
    listmoi=[]
    for x in list:
        if x.tiet == "08:00:00":
            x.tiet= "1"
            listmoi.append(x)
        if x.tiet == "09:05:00":
            x.tiet= "2"
            listmoi.append(x)
        if x.tiet == "09:55:00":
            x.tiet= "3"
            listmoi.append(x)
        if x.tiet == "10:45:00":
            x.tiet= "4"
            listmoi.append(x)
        if x.tiet == "11:35:00":
            x.tiet= "5"
            listmoi.append(x)
    return listmoi

def getLogin(request):
    rl = bool
    name = request.session.get('name') #eeeeeeeeee
    role = request.session.get('role') #eeeeeeeeee
    id = request.session.get('id') #eeeeeeeeee
    if role == "ADMIN":
        rl = True
    else:
        rl =False
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
            request.session['userName'] = str(user.userName)
            checkHSD()
            # checkLab()
            checkGioMuon()
        except:
            return render(request, 'pages/Login.html')
        listDevice =[]
        listDevice0 =[]
        for x in device:
            if x.unit !="phòng" and int(x.quantity) > 0:
                listDevice.append(x)
            if x.unit !="phòng" and int(x.quantity) <= 0:
                listDevice0.append(x)
        id = request.session.get('id') #eeeeeeeeee
        thongbao = BorrowReturn.objects.select_related('deviceId','userId').filter(userId=id).order_by('-id')[0:5]
        listT = []
        for x in thongbao:
            if "-T" in x.giaovien:
                listT.append(x)
        rl = bool
        name = request.session.get('name') #eeeeeeeeee
        role = request.session.get('role') #eeeeeeeeee
        id = request.session.get('id') #eeeeeeeeee
        if role == "ADMIN":
            rl = True
        else:
            rl =False
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
    checkHSD()
    # checkLab()
    checkGioMuon()
    name = request.session.get('name') #eeeeeeeeee
    userName = request.session.get('userName') #eeeeeeeeee
    id = request.session.get('id') #eeeeeeeeee
    rl = bool
    role = request.session.get('role') #eeeeeeeeee
    if role == "ADMIN":
        rl = True
    else:
        rl =False
    if request.method == 'POST':
        deviceId = request.POST.get('deviceId')
        mon = request.POST.get('mon')
        search = request.POST.get('search')
        if search != None and search != '':
            search = search.upper()
            device = Device.objects.all()
            list = []
            for x in device:
                if search in x.name and x.unit != 'phòng':
                    list.append(x)
                listT =thongBao(request)
            return render(request, 'pages/Home.html',{"device": list,"thongbao":listT,"id":id,"name":name,"role":rl})
        if deviceId!=None:
            device = Device.objects.get(id = deviceId)
            listT = thongBao(request)
            return render(request, 'pages/Borrowdevice.html',{"device": device,"thongbao":listT,"name":name,"role":rl,"userName":userName})
        if mon!="":
            device = Device.objects.filter(code = mon)
            listT = thongBao(request)
            return render(request, 'pages/Home.html',{"device": device,"thongbao":listT,"name":name,"role":rl})
    device = Device.objects.all()
    listDevice =[]
    listDevice0 =[]
    for x in device:
        if x.unit !="phòng" and int(x.quantity) > 0:
            listDevice.append(x)
        if x.unit !="phòng" and int(x.quantity) <= 0:
            listDevice0.append(x)
    listT = thongBao(request)
    return render(request, 'pages/Home.html',{"device":listDevice,"role":rl,"name":name,"device0":listDevice0,"thongbao":listT})
def getThongKe(request):
    checkHSD()
    # checkLab()
    checkGioMuon()
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
            return render(request, 'pages/Thongke.html',{"device":giosangtiet(list), "sum":sum,"name":nameUser,"role":rl,"thongbao":listT})
        if giaovien != None:
            list = []
            for x in device:
               if giaovien in x.giaovien:
                   list.append(x)
            sum =0
            for x in list:
                sum =sum+1
            listT =thongBao(request)
            return render(request, 'pages/Thongke.html',{"device":giosangtiet(list), "sum":sum,"name":nameUser,"role":rl,"thongbao":listT})
        if nams != "" and name != "":
            r = BorrowReturn.objects.filter(muon__gte=f"{nams}-1-1", muon__lte=f"{name}-12-31")
            sum =0
            for x in r:
                sum =sum+1
            listT =thongBao(request)
            return render(request, 'pages/Thongke.html',{"device":giosangtiet(r), "sum":sum,"name":nameUser,"role":rl, "thongbao":listT})
        if ngays != None and ngaye != None:
            r = BorrowReturn.objects.filter(muon__gte=f"{ngays}", muon__lte=f"{ngaye}")
            sum =0
            for x in r:
                sum =sum+1
            listT =thongBao(request)
            return render(request, 'pages/Thongke.html',{"device":giosangtiet(r),"sum":sum,"name":nameUser,"role":rl,"thongbao":listT})
        if e != None:
            device = BorrowReturn.objects.select_related('deviceId','userId').all().order_by('id')
            file = excel(giosangtiet(device))
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
    return render(request, 'pages/Thongke.html',{"device":giosangtiet(device), "sum":sum,"name":nameUser ,"role":rl,"thongbao":listT})


def getAdmin(request):
    checkHSD()
    # checkLab()
    checkGioMuon()
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
        mon = request.POST.get('mon')
        search = request.POST.get('search')
        if search != None and search != '':
            search=search.upper()
            device = Device.objects.all()
            list = []
            for x in device:
                if search in x.name:
                    list.append(x)
            listT =thongBao(request)
            return render(request, 'pages/Admin.html',{"device": list,"thongbao":listT,"name":name,"role":rl})
        if(xoa!=None):
            device = get_object_or_404(Device, pk=xoa)
            device.delete()
            return redirect('/admins')
        if capnhat != None:
            device = Device.objects.get(id =capnhat)
            listT =thongBao(request)
            return render(request, 'pages/Add.html',{"device":device, "role":rl,"name":name, "thongbao":listT})
        if mon!="" or mon != None:
            device = Device.objects.all()
            listmon =[]
            for x in device:
                if mon in x.code:
                    listmon.append(x)
            listT = thongBao(request)
            return render(request, 'pages/Admin.html',{"device": listmon,"thongbao":listT,"name":name,"role":rl})
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
    checkHSD()
    # checkLab()
    checkGioMuon()
    userName = request.session.get('userName') #eeeeeeeeee
    name = request.session.get('name') #eeeeeeeeee
    rl = bool
    role = request.session.get('role') #eeeeeeeeee
    if role == "ADMIN":
        rl = True
    else:
        rl =False
    if request.method == 'POST':
        deviceId = request.POST.get('deviceId')
        if deviceId != None:
            device = Device.objects.get(id=deviceId)
            listT = thongBao(request)
            return render(request,'pages/Borrowlab.html',{"device": device,"name":name,"role":rl,"userName":userName})
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
        if x.unit =="phòng" and int(x.quantity) <=0:
            listDevice0.append(x)
    listT = thongBao(request)
    return render(request, 'pages/Lab.html',{"device0":listDevice0,"device1":listDevice1,"device2":listDevice2,"device3":listDevice3,"device4":listDevice4,"deviceKt":listDeviceKt,"role":rl,"name":name,"tb":True,"thongbao":listT})

def getBorrowLab(request):
    checkHSD()
    # checkLab()
    checkGioMuon()
    userName = request.session.get('userName') #eeeeeeeeee
    if request.method == 'POST':
        giaovien = request.POST.get('giaovien')
        lop = request.POST.get('lop')
        ngaym = request.POST.get('ngaym')
        ngayt = request.POST.get('ngayt')
        tietm = request.POST.get('tietm')
        deviceId = request.POST.get('deviceId')
        id = request.session.get('id') #eeeeeeeeee
        if checkSLM(deviceId,tietm,ngaym):
            if giaovien != "" and lop != "" and ngaym != "" and ngayt !="" and tietm != "" and deviceId != "" :
                borrowReturn = BorrowReturn(userId_id=int(id),deviceId_id=int(deviceId),muon=ngaym,tra=ngayt,lop=lop, giaovien =giaovien,tiet=tietm)
                borrowReturn.save()
                return redirect('/thietbidangduocmuon')
        device = Device.objects.get(id = deviceId)
        listT = thongBao(request)
        return render(request, 'pages/BorrowLab.html',{"device": device,"thongbao":listT,"userName":userName})
    listT = thongBao(request)
    return render(request, 'pages/BorrowLab.html',{"thongbao":listT,"userName":userName})

def getBorrowDevice(request):
    checkHSD()
    # checkLab()
    checkGioMuon()
    userName = request.session.get('userName') #eeeeeeeeee
    if request.method == 'POST':
        giaovien = request.POST.get('giaovien')
        lop = request.POST.get('lop')
        ngaym = request.POST.get('ngaym')
        ngayt = request.POST.get('ngayt')
        tietm = request.POST.get('tietm')
        deviceId = request.POST.get('deviceId')
        id = request.session.get('id') #eeeeeeeeee
        if checkSLM(deviceId,tietm,ngaym):
            if giaovien != "" and lop != "" and ngaym != "" and ngayt !="" and tietm != "" and deviceId != "" :
                borrowReturn = BorrowReturn(userId_id=int(id),deviceId_id=int(deviceId),muon=ngaym,tra=ngayt,lop=lop, giaovien =giaovien,tiet=tietm)
                borrowReturn.save()
                return redirect('/thietbidangduocmuon')
        device = Device.objects.get(id = deviceId)
        listT = thongBao(request)
        return render(request, 'pages/Borrowdevice.html',{"device": device,"thongbao":listT,"userName":userName})
    listT = thongBao(request)
    return render(request, 'pages/BorrowDevice.html',{"thongbao":listT,"userName":userName})
def getThietBiDangDuocMuon(request):
    checkHSD()
    # checkLab()
    checkGioMuon()
    name = request.session.get('name') #eeeeeeeeee
    rl = bool
    role = request.session.get('role') #eeeeeeeeee
    if role == "ADMIN":
        rl = True
    else:
        rl =False
    if request.method == 'POST':
        mon = request.POST.get('mon')
        xoa = request.POST.get('xoa')
        idtra = request.POST.get('idtra')
        search = request.POST.get('search')
        if search != None and search != '':
            search=search.upper()
            idUser = request.session.get('id') #eeeeeeeeee
            device = BorrowReturn.objects.select_related('deviceId','userId').filter(userId=idUser)
            listm=[]
            listt=[]
            for x in device:
                if "-T" in x.giaovien:
                    if search in x.deviceId.name:
                        listt.append(x)  
                else:
                    if search in x.deviceId.name:
                        listm.append(x)
            listT =thongBao(request)
            return render(request, 'pages/Thietbidangduocmuon.html',{"device1": listm,"device2":listt,"role":rl,"name":name,"thongbao":listT})
        if xoa != None and idtra != None:
            device = Device.objects.get(id=xoa)
            device.quantity = int(device.quantity)+1
            device.save()
            borrowReturn = BorrowReturn.objects.get(id=idtra)
            borrowReturn.giaovien = str(borrowReturn.giaovien)+"T"
            borrowReturn.save()
            return redirect('/thietbidangduocmuon')
        if mon!="":
            idUser = request.session.get('id') #eeeeeeeeee
            device = BorrowReturn.objects.select_related('deviceId','userId').filter(userId=idUser)
            listm=[] #admin
            listtruT=[] #admin-T
            listTru=[] #admin-
            for x in device:
                if "-" in x.giaovien:
                    if mon == x.deviceId.code:
                        if "T" in x.giaovien:
                            listtruT.append(x)
                        else:
                           listTru.append(x)
                else:
                    if mon == x.deviceId.code:
                        listm.append(x)
            listm1 =giosangtiet(listm)
            listTru1 =giosangtiet(listTru)
            listtruT1 =giosangtiet(listtruT)
            listT =thongBao(request)
            return render(request, 'pages/Thietbidangduocmuon.html',{"device1": listTru1,"device2":listm1,"device3":listtruT1,"role":rl,"name":name,"thongbao":listT})
    idUser = request.session.get('id') #eeeeeeeeee
    device = BorrowReturn.objects.select_related('deviceId','userId').filter(userId=idUser)
    listm=[] #admin
    listtruT=[] #admin-T
    listTru=[] #admin-
    for x in device:
        if "-" in x.giaovien:
            if "T" in x.giaovien:
                listtruT.append(x)
            else:
                listTru.append(x)
        else:
            listm.append(x)
    listm1 =giosangtiet(listm)
    listTru1 =giosangtiet(listTru)
    listtruT1 =giosangtiet(listtruT)
    listT = thongBao(request)
    return render(request, 'pages/Thietbidangduocmuon.html',{"device1": listTru1,"device2":listm1,"device3":listtruT1,"role":rl,"name":name,"thongbao":listT})
def getBase(request):
    name = request.session.get('name') #eeeeeeeeee
    rl = bool
    role = request.session.get('role') #eeeeeeeeee
    if role == "ADMIN":
        rl = True
    else:
        rl =False
    return render(request, 'pages/Thongbao.html',{"role": rl,"name":name})