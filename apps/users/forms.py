from django import forms
from captcha.fields import CaptchaField


class LoginForm(forms.Form):
    '''登录'''
    username = forms.CharField(max_length=20,required=True,widget=forms.TextInput(attrs={'placeholder':'请输入用户名'}))
    password = forms.CharField(max_length=12,required=True,widget=forms.PasswordInput(attrs={'placeholder':"请输入密码"}))



class RegisterForm(forms.Form):
    '''注册'''
    email = forms.EmailField(required=True,widget=forms.TextInput(attrs={'placeholder':"请输入您的邮箱地址"}))
    password = forms.CharField(required=True,widget=forms.PasswordInput(attrs={'placeholder':"请输入6-12位密码"}))
    # 验证码，可以定义错误信息
    captcha = CaptchaField()

class ForgetPwdForm(forms.Form):
    '''找回密码'''
    email = forms.EmailField(required=True)
    captcha = CaptchaField(error_messages={'invalid':"验证码错误"})

class ModifyPwdForm(forms.Form):
    '''重置密码'''
    password1 = forms.CharField(max_length=16,required=True)
    password2 = forms.CharField(max_length=16,required=True)

