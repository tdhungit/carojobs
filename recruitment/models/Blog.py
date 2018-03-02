from django.db import models
from django.contrib import admin

from carojobs.models import ModelBase
from ckeditor.fields import RichTextField

from carojobs.settings import MEDIA_DOMAIN
from recruitment import helpers
from recruitment.const import BLOG_STATUS


class BlogCategory(ModelBase):
    name = models.CharField(max_length=200)
    slug = models.CharField(max_length=200)
    image = models.ImageField(upload_to=helpers.generate_uploadfile, default='no-image.png')
    description = models.TextField(null=True)
    blog_count = models.IntegerField(default=0)

    def __str__(self):
        return self.name

    def image_tag(self):
        image_url = str(self.image)

        if image_url.find('http://') >= 0:
            return u'<img src="%s" style="max-height: 40px">' % image_url
        else:
            return u'<img src="%s" style="max-height: 40px">' % (MEDIA_DOMAIN + image_url)

    image_tag.allow_tags = True


class BlogCategoryAdmin(admin.ModelAdmin):
    list_display = ['image_tag', 'name']


class Blog(ModelBase):
    name = models.CharField(max_length=200)
    slug = models.CharField(max_length=200)
    image = models.ImageField(upload_to=helpers.generate_uploadfile, default='no-image.png')
    summary = models.TextField()
    content = RichTextField()
    public_date = models.DateField()
    status = models.CharField(max_length=200, null=True, choices=BLOG_STATUS)
    active = models.BooleanField(default=True)
    category = models.ManyToManyField(BlogCategory, through='Blog2Category')

    def __str__(self):
        return self.name

    def image_tag(self):
        image_url = str(self.image)

        if image_url.find('http://') >= 0:
            return u'<img src="%s" style="max-height: 40px">' % image_url
        else:
            return u'<img src="%s" style="max-height: 40px">' % (MEDIA_DOMAIN + image_url)

    image_tag.allow_tags = True


class Blog2Category(ModelBase):
    category = models.ForeignKey(BlogCategory, on_delete=models.CASCADE)
    blog = models.ForeignKey(Blog, on_delete=models.CASCADE)


class Blog2CategoryAdmin(admin.TabularInline):
    model = Blog.category.through


class BlogAdmin(admin.ModelAdmin):
    list_display = ['image_tag', 'name', 'public_date', 'status', 'active']
    inlines = (Blog2CategoryAdmin,)
