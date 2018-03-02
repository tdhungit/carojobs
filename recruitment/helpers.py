import datetime


def generate_uploadfile(instance, filename):
    today = datetime.datetime.today()
    url = "%s/%s/%s/%s" % (today.strftime('%Y'), today.strftime('%m'), today.strftime('%d'), filename)
    return url
