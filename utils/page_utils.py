from django.core.paginator import Paginator


def process_page(current_page,data):


    paginator = Paginator(data,3)
    page_obj = paginator.page(current_page)
    # 总页数
    pages = paginator.num_pages
    page = int(current_page)
    page_li = [i for i in range(1, pages + 1) if i >= page - 2 and i <= page + 2 or i == 1 or i == pages]
    try:
        if page_li[1] != 2:
            page_li.insert(1, '...')
        if page_li[-2] != pages - 1:
            page_li.insert(-1, '...')
    except IndexError as e:
        pass
    return page_obj,page_li