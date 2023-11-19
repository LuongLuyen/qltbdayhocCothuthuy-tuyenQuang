from django import forms
from .models import User,BorrowReturn

class UserForm(forms.ModelForm):
    class Meta:
        model = User
        fields = ['userName', 'password', 'role']

class BorrowReturnForm(forms.ModelForm):
    class Meta:
        model = BorrowReturn
        fields = ['userId', 'deviceId', 'muon','tra','lop','tiet']