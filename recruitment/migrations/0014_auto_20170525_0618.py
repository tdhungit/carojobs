# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2017-05-25 06:18
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('recruitment', '0013_auto_20170525_0601'),
    ]

    operations = [
        migrations.AddField(
            model_name='blog',
            name='active',
            field=models.BooleanField(default=True),
        ),
        migrations.AddField(
            model_name='page',
            name='active',
            field=models.BooleanField(default=True),
        ),
        migrations.AlterField(
            model_name='blog',
            name='status',
            field=models.CharField(max_length=200, null=True),
        ),
        migrations.AlterField(
            model_name='page',
            name='status',
            field=models.CharField(max_length=200, null=True),
        ),
    ]
