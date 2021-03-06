# -*- coding: utf-8 -*-
# Generated by Django 1.10.6 on 2017-04-18 07:21
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('recruitment', '0002_auto_20170414_2352'),
    ]

    operations = [
        migrations.CreateModel(
            name='Job',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_date', models.DateTimeField(auto_now_add=True, verbose_name='Date created record')),
                ('deleted', models.BooleanField(default=False)),
                ('name', models.CharField(max_length=200)),
                ('detail', models.TextField()),
                ('summary_1', models.CharField(max_length=200)),
                ('summary_2', models.CharField(max_length=200)),
                ('summary_3', models.CharField(max_length=200)),
                ('location', models.CharField(max_length=200)),
                ('type', models.CharField(max_length=200)),
                ('salary_min', models.IntegerField()),
                ('salary_max', models.IntegerField()),
                ('salary_currency', models.CharField(default='USD', max_length=200)),
                ('salary_type', models.CharField(default='Monthly', max_length=200)),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='JobCategory',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_date', models.DateTimeField(auto_now_add=True, verbose_name='Date created record')),
                ('deleted', models.BooleanField(default=False)),
                ('name', models.CharField(max_length=200)),
                ('slug', models.CharField(max_length=200, null=True)),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.AddField(
            model_name='job',
            name='category',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='recruitment.JobCategory'),
        ),
        migrations.AddField(
            model_name='job',
            name='company',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='recruitment.Company'),
        ),
    ]
