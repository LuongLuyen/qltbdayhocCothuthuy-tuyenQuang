from django import forms
from .models import User,Device,BorrowReturn

class UserForm(forms.ModelForm): # chuyển form sang model tương ứng
    class Meta:
        model = User
        fields = ['userName', 'password','name', 'role']
class mtForm(forms.ModelForm):
    class Meta:
        model = BorrowReturn
        fields = ['muon', 'tra','lop', 'giaovien','tiet','userId','deviceId']

class DeviceForm(forms.ModelForm):
    class Meta:
        model = Device
        fields = ['userId', 'name','mon','code','unit','price','quantity','status','date','location','hansudung']