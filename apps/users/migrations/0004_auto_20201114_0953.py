# Generated by Django 2.2.16 on 2020-11-14 01:53

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0003_auto_20201104_2033'),
    ]

    operations = [
        migrations.AlterField(
            model_name='emailverfyrecord',
            name='send_type',
            field=models.CharField(choices=[('register', '注册'), ('forget', '找回密码'), ('update_email', '修改邮箱')], max_length=20),
        ),
    ]
