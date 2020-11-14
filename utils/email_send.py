import random

from django.conf import settings
from django.core.mail import send_mail
from users.models import EmailVerfyRecord




def random_srt(random_length=8):
    str = ''
    chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz0123456789'
    for i in range(0,random_length):
        index = random.randint(0,len(chars))
        str+=chars[index]

    return str





def send_register_email(email,send_type='register'):
    # 发送之前先保存到数据库，到时候查询连接是否存在
    # 实例化一个EmailVerfyRecord()对象
    email_record = EmailVerfyRecord()
    # 随机生成一个字符串
    code = random_srt()
    email_record.email = email
    email_record.send_type = send_type
    email_record.code = code
    email_record.save()

    # 准备发送邮件
    subject = ''
    message = ''
    if send_type == 'register':
        subject = '欢迎注册在线教育网站'
        message = '<a href="http://127.0.0.1:8000/user/active/%s/">点击激活</a>'%code
        send_status = send_mail(
            subject=subject,
            message=message,
            from_email=settings.EMAIL_HOST_USER,
            recipient_list=[email],
            html_message=message,
        )
        if send_status:
            pass
    if send_type == 'forget':
        subject = '找回密码'
        message = '<a href="http://127.0.0.1:8000/user/reset/{0}/">点击找回密码</a>'.format(code)
        send_status = send_mail(
            subject=subject,
            message=message,
            from_email=settings.EMAIL_HOST_USER,
            recipient_list=[email],
            html_message=message,
        )
        if send_status:
            pass
    elif send_type == "update_email":
        email_title = "NBA邮箱修改验证码"
        email_body = "你的邮箱验证码为{0}".format(code)

        # 使用Django内置函数完成邮件发送。四个参数：主题，邮件内容，从哪里发，接受者list
        send_status = send_mail(email_title, email_body, settings.EMAIL_HOST_USER, [email])
        # 如果发送成功
        if send_status:
            pass
