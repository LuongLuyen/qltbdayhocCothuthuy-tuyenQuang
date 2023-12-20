from django.shortcuts import render,redirect,get_object_or_404
from datetime import datetime,timedelta
import pytz
from django.http import HttpResponse
from openpyxl import Workbook


from .models import User, Device,BorrowReturn
from django.contrib.auth import logout
from .forms import UserForm,DeviceForm,mtForm

def thongBao(request):
    id = request.session.get('id') #eeeeeeeeee
    thongbao = BorrowReturn.objects.select_related('deviceId','userId').filter(userId=id).order_by('-id')[0:5]
    listT = []
    for x in thongbao:
        if "-T" in x.giaovien:
            listT.append(x)
    return listT
def excel(list): # xuat tat ca
    workbook = Workbook()
    worksheet = workbook.active
    headers = ["ID","Tên thiết bị","Ngày mượn", "Giáo viên mượn cho lớp (-T là Đã trả  )", "Tiết","code","Đơn vị","Giá","Số lượng(mỗi lần)","Ngày nhập","Xuất sứ","Tên người dùng","role","Hạn sử dụng","Trạng thái"] 
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
        worksheet.cell(row=row_num, column=15, value=device.deviceId.status)

    response = HttpResponse(content_type='application/vnd.openxmlformats-officedocument.spreadsheetml.sheet')
    response['Content-Disposition'] = 'attachment; filename=device_data.xlsx'
    workbook.save(response)
    return response

def excelHsd(list): # xuat thiet bi het han
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
    response['Content-Disposition'] = 'attachment; filename=hsd_data.xlsx'
    workbook.save(response)
    return response

def excelNd(list): # xuat nguoi dung
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

def timeVietnam(dmy): #lấy thời gian thực việt nam
    if dmy == "dmy":
        vietnam = pytz.timezone('Asia/Ho_Chi_Minh')
        time = datetime.now(vietnam)
        return time.strftime('%Y-%m-%d') # chỉ lấy yyyy/mm/dd
    else:
        vietnam = pytz.timezone('Asia/Ho_Chi_Minh')
        time = datetime.now(vietnam)
        return time.strftime('%Y-%m-%d %H:%M:%S') # lấy cả giờ phút giây

def checkHSD(): # kiểm tra hạn sử dụng
    list = Device.objects.all()
    device = [] # lặp qua tất cả lấy những hóa chất cho vào mảng này
    for x in list:
        if x.hansudung != "#":
            device.append(x)
    for x in device:
        dateNow =str(timeVietnam("dmy"))
        hsd= x.hansudung
        if(hsd < dateNow or hsd == dateNow):
            x.status = 'Hết hạn'
            x.save() # lặp qua mảng trên kiểm tra cái nào đã quá hạn set nó = Hết hạn

def checkGioMuon(): 
    borrowReturn = BorrowReturn.objects.all() #lấy ra bảng lsm ds các thiết bị đã đc đky
    listls=[] #tạo ds mới  những thiết bị mượn ngay hôm đó
    for x in borrowReturn:
        if "-" in x.giaovien:
            non=0
        else:
            dateNow =str(timeVietnam("dmy")) #lấy giờ thực tế
            # dateNow = "2023-12-02" # test thời gian timetest
            if dateNow in x.muon:
                listls.append(x) # thêm vào
    for x in listls:
        input_time_string = x.tiet
        input_time = datetime.strptime(input_time_string, "%H:%M:%S")
        result_time = input_time - timedelta(minutes=45)
        result_time_string = result_time.strftime("%H:%M:%S")
        T= str(x.muon) + " "+ result_time_string #2023-11-30 08:00:00  2023-11-30 07:15:00
        dateNow =str(timeVietnam("no"))
        # dateNow = "2023-12-02 09:20:00" # test thời gian timetest
        if T== dateNow or dateNow>T or dateNow< x.tiet:
            device = Device.objects.get(id=x.deviceId_id)
            mt= BorrowReturn.objects.get(id=x.id)
            mt.giaovien = mt.giaovien + "-"
            mt.save() # đánh dấu lại giáo viên đã nhận thiết bị
            # if int(device.quantity) > 0:
            device.quantity=int(device.quantity) -1
            device.save() # thõa mãn giờ bắt đầu thì trừ thiết bị trong kho lưu lại

def checkSLM(deviceId,tietm,ngaym): #lấy lúc mình bấm mượn
    dateNow =str(timeVietnam("no"))
    # dateNow = "2023-12-02 09:20:00" #test thời gian timetest
    input_time_string = tietm
    input_time = datetime.strptime(input_time_string, "%H:%M:%S")
    result_time = input_time - timedelta(minutes=45)
    result_time_string = result_time.strftime("%H:%M:%S")
    T= str(ngaym) + " "+ result_time_string #  
    if T < dateNow:
        return False
    device =Device.objects.get(id=deviceId)
    mt =BorrowReturn.objects.filter(deviceId=deviceId) 
    slDaMuon =0
    slk = int(device.quantity)
    cnt = 1
    slkbd = int(device.quantity)
    borrowReturn = BorrowReturn.objects.all() #lấy ra bảng lsm ds các thiết bị đã đc đky
    listls=[] #tạo ds mới  những thiết bị mượn ngay hôm đó
    for x in mt:
        if "T" in x.giaovien:
            non=0
        else:
            if "-" in x.giaovien:
                slkbd = int(slkbd) + 1
            datedky= ngaym + " " + tietm
            datex = x.muon + " " + x.tiet
            print("datedky:",datedky, " datex:", datex)
            if datedky == datex :
                cnt = int(cnt) + 1
    print(dateNow, T)
    print(cnt, slkbd, device.quantity)
    if cnt <= slkbd:
        return True
    else:
        return False
    
def giosangtiet(list): # chuyển đổi giừo sang tiết lặp qua xem nó thõa mãn trường hợp nào thì thêm nó vào mảng mới ,dùng chung
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
def checkLogin(request): # kiểm tra người đùng đã đăng nhập hay chưa
    id = request.session.get('id') #eeeeeeeeee
    if id != None:
        return True
    else:
        return False
def getLogin(request): # hàm phụ trách  view đăng nhập
    rl = bool
    name = request.session.get('name') #eeeeeeeeee   lấy ra từ lưu trữ phiên khi đăng nhập thành công (session)
    role = request.session.get('role') #eeeeeeeeee
    id = request.session.get('id') #eeeeeeeeee
    if role == "ADMIN": # kiểm tra quyền người dùng
        rl = True
    else:
        rl =False
    if request.method == 'POST': # submit form
        userName = request.POST.get('userName') # lấy thông tin đăng nhập từ form
        password = request.POST.get('password')
        out = request.POST.get('out') # kiểm tra đăng xuất
        xtk = request.POST.get('xtk')
        if(xtk!=None): # xóa tk
            device = get_object_or_404(User, pk=xtk)
            device.delete()
            return redirect('/')
        l = Device.objects.all()
        device=[]
        for x in l:
            if x.status != "Hết hạn":
                device.append(x)
        if(out=="out"): # nếu là đăng xuất  xóa session ,cho về  đăng nhập
            if 'id' in request.session:
                del request.session['id']
                del request.session['name']
                request.session.pop('role', None)
            logout(request)
            return render(request, 'pages/Login.html')
        try:
            user = User.objects.get(userName=userName,password=password) # đăng nhập thành công lưu người dùng lại
            request.session['id'] = str(user.id)
            request.session['role'] = str(user.role)
            request.session['name'] = str(user.name)
            request.session['userName'] = str(user.userName)
            checkHSD() # kiểm tra hạn sử dụng
            checkGioMuon() # kiểm tra giừo mượn
        except:
            return render(request, 'pages/Login.html') # nếu có exception cho về đăng nhập
        listDevice =[] # thiế bị còn lưu vào mảng này
        listDevice0 =[] # nếu hết thì vào  đây
        for x in device:
            if x.unit !="phòng" and int(x.quantity) > 0:
                listDevice.append(x)
            if x.unit !="phòng" and int(x.quantity) <= 0:
                listDevice0.append(x)
        id = request.session.get('id') #eeeeeeeeee
        thongbao = BorrowReturn.objects.select_related('deviceId','userId').filter(userId=id).order_by('-id')[0:5] # lấy 5 lịch sử mới nhất để hiển thị thông báo
        listT = [] # những thiết bị đã trả vào mảng này
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
        return render(request, 'pages/Home.html',{'device':listDevice,"role":rl,"name":name,"id":id, "device0":listDevice0,"thongbao":listT,"id":id})
    return render(request, 'pages/Login.html')

def getRegister(request): # đăng ký
    if request.method == 'POST':
        form = UserForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('/') # đăng ký thành công cho về trang đăng nhập
    else:
        form = UserForm()
    return render(request, 'pages/Register.html', {'form': form})
def getHome(request):
    id = request.session.get('id') #eeeeeeeeee
    if checkLogin(request):
        checkHSD()
        checkGioMuon()
        name = request.session.get('name') #eeeeeeeeee
        userName = request.session.get('userName') #eeeeeeeeee
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
            if search != None and search != '': # thanh tìm kiếm  input thuộc tên thiết bị lưu vào mảng mới và trả về
                search = search.upper()
                l = Device.objects.all()
                device=[]
                for x in l:
                    if x.status != "Hết hạn":
                        device.append(x)
                list = []
                for x in device:
                    if search in x.name and x.unit != 'phòng':
                        list.append(x)
                    listT =thongBao(request)
                return render(request, 'pages/Home.html',{"device": list,"thongbao":listT,"id":id,"name":name,"role":rl,"id":id})
            if deviceId!=None: # nút đăng ký mượn trả thiết bị đó về  trang thôing tin mươn
                device = Device.objects.get(id = deviceId)
                listT = thongBao(request)
                return render(request, 'pages/Borrowdevice.html',{"device": device,"thongbao":listT,"name":name,"role":rl,"userName":userName})
            if mon!="": #tìm kiếm theo môn
                l = Device.objects.all()
                device=[]
                for x in l:
                    if x.status != "Hết hạn":
                        device.append(x)
                list = []
                for x in device:
                    if mon in x.code and x.unit != 'phòng':
                        list.append(x)
                listT = thongBao(request)
                return render(request, 'pages/Home.html',{"device": list,"thongbao":listT,"name":name,"role":rl,"id":id})
        l = Device.objects.all()
        device=[]
        for x in l:
            if x.status != "Hết hạn":
                device.append(x)
        listDevice =[] # như trên
        listDevice0 =[]
        for x in device:
            if x.unit !="phòng" and int(x.quantity) > 0:
                listDevice.append(x)
            if x.unit !="phòng" and int(x.quantity) <= 0:
                listDevice0.append(x)
        listT = thongBao(request)
        return render(request, 'pages/Home.html',{"device":listDevice,"role":rl,"name":name,"device0":listDevice0,"thongbao":listT,"id":id})
    else:
        return redirect('/') # chưa đăng nhạp cho về trang đăng nhập
def getThongKe(request):
    id = request.session.get('id') #eeeeeeeeee
    if checkLogin(request): # tương tự
        checkHSD()
        checkGioMuon()
        nameUser = request.session.get('name') #eeeeeeeeee
        rl = bool
        role = request.session.get('role') #eeeeeeeeee
        if role == "ADMIN":
            rl = True
        else:
            rl =False
        l = BorrowReturn.objects.select_related('deviceId','userId').all()
        device =[]
        for x in l:
            if x.deviceId.status != "Hết hạn":
                device.append(x)
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
            if mon != None: # thống kê theo môn
                list = []
                for x in device:
                    if mon in x.deviceId.code:
                        list.append(x)
                    sum =0
                for x in list:
                    sum =sum+1
                listT =thongBao(request)
                return render(request, 'pages/Thongke.html',{"device":giosangtiet(list), "sum":sum,"name":nameUser,"role":rl,"thongbao":listT,"id":id})
            if giaovien != None: # thống kê theo giáo viên
                list = []
                for x in device:
                    if giaovien in x.giaovien:
                        list.append(x)
                    sum =0
                for x in list:
                    sum =sum+1
                listT =thongBao(request)
                return render(request, 'pages/Thongke.html',{"device":giosangtiet(list), "sum":sum,"name":nameUser,"role":rl,"thongbao":listT,"id":id})
            if nams != "" and name != "": # thống kê theo năm
                r = BorrowReturn.objects.filter(muon__gte=f"{nams}-1-1", muon__lte=f"{name}-12-31")
                sum =0
                for x in r:
                    sum =sum+1
                listT =thongBao(request)
                return render(request, 'pages/Thongke.html',{"device":giosangtiet(r), "sum":sum,"name":nameUser,"role":rl, "thongbao":listT,"id":id})
            if ngays != None and ngaye != None: # thống kê theo ngày nào đến ngày nào
                r = BorrowReturn.objects.filter(muon__gte=f"{ngays}", muon__lte=f"{ngaye}")
                sum =0
                for x in r:
                    sum =sum+1
                listT =thongBao(request)
                return render(request, 'pages/Thongke.html',{"device":giosangtiet(r),"sum":sum,"name":nameUser,"role":rl,"thongbao":listT,"id":id})
            if e != None: # xuất excel
                device = BorrowReturn.objects.select_related('deviceId','userId').all().order_by('id')
                file = excel(giosangtiet(device))
                return file
            if end != None: # tương tu
                user = User.objects.all().order_by('id')
                file = excelNd(user)
                return file
            if ehsd != None: # tuong tu
                device = Device.objects.all().order_by('id')
                listHsd = []
                for x in device:
                    if x.hansudung != "#" and x.status == "Hết hạn":
                        listHsd.append(x)
                file = excelHsd(listHsd)
                return file
        listT= thongBao(request)
        return render(request, 'pages/Thongke.html',{"device":giosangtiet(device), "sum":sum,"name":nameUser ,"role":rl,"thongbao":listT,"id":id})
    else:
        return redirect('/')
def getAdmin(request):
    id = request.session.get('id') #eeeeeeeeee
    if checkLogin(request):
        checkHSD()
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
            if search != None and search != '': # tìm kiếm
                search=search.upper()
                device = Device.objects.all()
                list = []
                for x in device:
                    if search in x.name:
                        list.append(x)
                listT =thongBao(request)
                return render(request, 'pages/Admin.html',{"device": list,"thongbao":listT,"name":name,"role":rl,"id":id})
            if(xoa!=None): # xóa thiết bị
                device = get_object_or_404(Device, pk=xoa)
                device.delete()
                return redirect('/admins')
            if capnhat != None: # cập nhật
                device = Device.objects.get(id =capnhat)
                listT =thongBao(request)
                return render(request, 'pages/Add.html',{"device":device, "role":rl,"name":name, "thongbao":listT,"id":id})
            if mon!="" or mon != None: # lọc môn hết hạn
                device = Device.objects.all()
                listmon =[]
                if mon == "hsd":
                    for x in device:
                        if "Hết hạn" == x.status:
                            listmon.append(x)
                else:
                    for x in device:
                        if mon in x.code:
                            listmon.append(x)
                listT = thongBao(request)
                return render(request, 'pages/Admin.html',{"device": listmon,"thongbao":listT,"name":name,"role":rl,"id":id})
        device = Device.objects.all()
        listT = thongBao(request)
        return render(request, 'pages/Admin.html',{"device":device,"role":rl,"name":name, "thongbao":listT,"id":id})
    else:
        return redirect('/')
def getAdd(request):
    if checkLogin(request):
        if request.method == 'POST':
            form = DeviceForm(request.POST)
            update = request.POST.get('capnhat')
            if(update!=None): # cập nhật thiết bị
                device = get_object_or_404(Device, pk=update)
                form = DeviceForm(request.POST, instance=device)
                if form.is_valid():
                    form.save()
                    return redirect('/admins')
            if form.is_valid(): # thêm mới
                form.save()
                return redirect('/admins')
        id = request.session.get('id') #eeeeeeeeee
        return render(request, 'pages/Add.html',{"id":id})
    else:
        return redirect('/')
def getLab(request):
    id = request.session.get('id') #eeeeeeeeee
    if checkLogin(request):
        checkHSD()
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
            if deviceId != None: # đăng ký phòng bộ môn
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
        for x in device: # lặp qua xem nó ở tầng nào
            if x.unit =="phòng":
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
                mt = BorrowReturn.objects.filter(deviceId=x.id)
                for x in mt:
                    if "-" in x.giaovien:
                        if "T" in x.giaovien:
                            non=0
                        else:
                            listDevice0.append(x)
        
        listT = thongBao(request)
        return render(request, 'pages/Lab.html',{"device0":giosangtiet(listDevice0),"device1":listDevice1,"device2":listDevice2,"device3":listDevice3,"device4":listDevice4,"deviceKt":listDeviceKt,"role":rl,"name":name,"tb":True,"thongbao":listT,"id":id})
    else:
        return redirect('/')
def getBorrowLab(request):
    if checkLogin(request):
        checkHSD()
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
            if checkSLM(deviceId,tietm,ngaym): # kiểm tra xem quá số lượng cho mượn chưa, chưa hết tiết bị thì vẫn mượn được
                if giaovien != "" and lop != "" and ngaym != "" and ngayt !="" and tietm != "" and deviceId != "" :
                    borrowReturn = BorrowReturn(userId_id=int(id),deviceId_id=int(deviceId),muon=ngaym,tra=ngayt,lop=lop, giaovien =giaovien,tiet=tietm)
                    borrowReturn.save()
                    return redirect('/thietbidangduocmuon')
            device = Device.objects.get(id = deviceId)
            listT = thongBao(request)
            return render(request, 'pages/BorrowLab.html',{"device": device,"thongbao":listT,"userName":userName}) # mấy cái return này trả về view , data tương ứng để hiển thị
        listT = thongBao(request)
        return render(request, 'pages/BorrowLab.html',{"thongbao":listT,"userName":userName})
    else:
        return redirect('/')
def getBorrowDevice(request):
    id = request.session.get('id') #eeeeeeeeee
    if checkLogin(request):
        checkHSD()
        checkGioMuon()
        userName = request.session.get('userName') #eeeeeeeeee
        if request.method == 'POST':
            giaovien = request.POST.get('giaovien')
            lop = request.POST.get('lop')
            ngaym = request.POST.get('ngaym')
            ngayt = request.POST.get('ngayt')
            tietm = request.POST.get('tietm')
            deviceId = request.POST.get('deviceId')
            update = request.POST.get('update')
            id = request.session.get('id') #eeeeeeeeee
            print(str(ngaym), str(tietm))

            if update == None: # them moi
                if checkSLM(deviceId,tietm,ngaym):
                    if giaovien != "" and lop != "" and ngaym != "" and ngayt !="" and tietm != "" and deviceId != "":
                        # print(ngaym, tietm)
                        borrowReturn = BorrowReturn(userId_id=int(id),deviceId_id=int(deviceId),muon=ngaym,tra=ngayt,lop=lop, giaovien =giaovien,tiet=tietm)
                        borrowReturn.save()
                        return redirect('/thietbidangduocmuon')
            else: # nếu trường hợp cập nhật lại lịch sử lên lịch mượn
                mt = get_object_or_404(BorrowReturn, pk=update)
                form = mtForm(request.POST, instance=mt)
                if checkSLM(deviceId,form.data['tiet'],form.data['muon']):
                    form.save()
                    return redirect('/thietbidangduocmuon')
                else:
                    mt = BorrowReturn.objects.filter(id=update)
                    return render(request, 'pages/Borrowdevice.html',{"devicemt": giosangtiet(mt)[0],"userName":userName})
            device = Device.objects.get(id = deviceId)
            listT = thongBao(request)
            return render(request, 'pages/Borrowdevice.html',{"device": device,"thongbao":listT,"userName":userName})
        listT = thongBao(request)
        return render(request, 'pages/BorrowDevice.html',{"thongbao":listT,"userName":userName})
    else:
        return redirect('/')
def getThietBiDangDuocMuon(request):
    id = request.session.get('id') #eeeeeeeeee
    if checkLogin(request):
        checkHSD()
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
            mon = request.POST.get('mon')
            xoa = request.POST.get('xoa')
            idtra = request.POST.get('idtra')
            search = request.POST.get('search')
            idxoalich = request.POST.get('idxoalich')
            xoalichsu = request.POST.get('xoalichsu')
            if(xoalichsu!=None): # xóa thiết bị
                device = get_object_or_404(BorrowReturn, pk=xoalichsu)
                device.delete()
                return redirect('/thietbidangduocmuon')
            if search != None and search != '': # tìm kiếm
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
                return render(request, 'pages/Thietbidangduocmuon.html',{"device1": listm,"device2":listt,"role":rl,"name":name,"thongbao":listT,"id":id})
            if xoa != None and idtra != None: # xác nhận trả
                device = Device.objects.get(id=xoa)
                device.quantity = int(device.quantity)+1
                device.save()
                borrowReturn = BorrowReturn.objects.get(id=idtra)
                borrowReturn.giaovien = str(borrowReturn.giaovien)+"T"
                borrowReturn.save()
                return redirect('/thietbidangduocmuon')
            if idxoalich != None: # cập nhật lại lịch sử mượn
                mt = BorrowReturn.objects.filter(id=idxoalich)
                return render(request, 'pages/Borrowdevice.html',{"devicemt": giosangtiet(mt)[0],"userName":userName})
            if mon!="": # hiển thị những thiét bị lên lịch,đã trả, chưa trả
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
                return render(request, 'pages/Thietbidangduocmuon.html',{"device1": listTru1,"device2":listm1,"device3":listtruT1,"role":rl,"name":name,"thongbao":listT,"id":id})
        idUser = request.session.get('id') #eeeeeeeeee
        device = BorrowReturn.objects.select_related('deviceId','userId').filter(userId=idUser)
        listm=[] #admin
        listtruT=[] #admin-T
        listTru=[] #admin-
        for x in device:# tương tự như trên
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
        return render(request, 'pages/Thietbidangduocmuon.html',{"device1": listTru1,"device2":listm1,"device3":listtruT1,"role":rl,"name":name,"thongbao":listT,"id":id})
    else:
        return redirect('/')
def getBase(request): # lấy base maecj địch 
    name = request.session.get('name') #eeeeeeeeee
    rl = bool
    role = request.session.get('role') #eeeeeeeeee
    if role == "ADMIN":
        rl = True
    else:
        rl =False
    return render(request, 'pages/Thongbao.html',{"role": rl,"name":name})