import re
from django import forms

from operation.models import UserAsk

class UserAskForm(forms.ModelForm):
    '''用户咨询'''

    class Meta:
        model = UserAsk
        fields = ['name','mobile','course_name']

    def clean_mobile(self):
        '''
        验证手机是否合法
        :return:
        '''
        mobile = self.cleaned_data.get('mobile')
        if re.match('^1[356789]\d{9}$',mobile):
            return mobile
        else:
            raise forms.ValidationError("手机号非法",code='mobile_invalid')



