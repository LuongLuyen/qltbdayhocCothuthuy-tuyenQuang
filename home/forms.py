from django import forms
from .models import User,Device

class UserForm(forms.ModelForm):
    class Meta:
        model = User
        fields = ['userName', 'password','name', 'role']

class DeviceForm(forms.ModelForm):
    class Meta:
        model = Device
        fields = ['userId', 'name','mon','code','unit','price','quantity','status','date','location','hansudung']