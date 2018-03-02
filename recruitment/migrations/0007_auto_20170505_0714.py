# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2017-05-05 07:14
from __future__ import unicode_literals

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('recruitment', '0006_auto_20170503_0653'),
    ]

    operations = [
        migrations.CreateModel(
            name='Candidate',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_date', models.DateTimeField(auto_now_add=True, verbose_name='Date created record')),
                ('deleted', models.BooleanField(default=False)),
                ('name', models.CharField(max_length=200, null=True)),
                ('first_name', models.CharField(max_length=200)),
                ('last_name', models.CharField(max_length=200)),
                ('avatar', models.CharField(max_length=200)),
                ('email', models.EmailField(max_length=200)),
                ('password', models.CharField(max_length=200)),
                ('status', models.CharField(max_length=200)),
                ('phone', models.CharField(max_length=200, null=True)),
                ('alternate_phone', models.CharField(max_length=200, null=True)),
                ('birthday', models.DateField(null=True)),
                ('address1', models.CharField(max_length=200, null=True)),
                ('address2', models.CharField(max_length=200, null=True)),
                ('state', models.CharField(max_length=200, null=True)),
                ('city', models.CharField(max_length=200, null=True)),
                ('post_code', models.CharField(max_length=200, null=True)),
                ('country', models.CharField(max_length=200, null=True)),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='JobApply',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_date', models.DateTimeField(auto_now_add=True, verbose_name='Date created record')),
                ('deleted', models.BooleanField(default=False)),
                ('apply_date', models.DateField()),
                ('status', models.CharField(max_length=200)),
                ('candidate', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='recruitment.Candidate')),
                ('job', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='recruitment.Job')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.AddField(
            model_name='job',
            name='candidate',
            field=models.ManyToManyField(through='recruitment.JobApply', to='recruitment.Candidate'),
        ),
    ]
