from django import template
from ..models import UserFavorite
register = template.Library()



@register.simple_tag(takes_context=True)
def favorite(context,org_id,type):
    user = context['request'].user
    if not user.is_authenticated:
        return '收藏'
    elif UserFavorite.objects.filter(user=user,fav_id=org_id,fav_type=type):

        return '已收藏'
    else:
        return '收藏'





