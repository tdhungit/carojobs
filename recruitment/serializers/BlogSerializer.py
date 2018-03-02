from rest_framework import serializers

from recruitment.models.Blog import BlogCategory, Blog


class BlogCategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = BlogCategory
        fields = ('id', 'name', 'slug', 'image', 'description', 'blog_count')


class BlogSerializer(serializers.ModelSerializer):
    category = BlogCategorySerializer(read_only=True, many=True)

    class Meta:
        model = Blog
        fields = ('id', 'name', 'slug', 'image', 'summary', 'content', 'public_date', 'category')
