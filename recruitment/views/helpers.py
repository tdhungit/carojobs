from recruitment.models.Employer import Employer


def is_validate_account(request):
    account_id = request.GET['account']
    if not account_id:
        return False

    user = request.user
    employer = Employer.objects.get(user=user)

    try:
        account = employer.account.get(id=account_id)
    except:
        account = None

    if account is None:
        return False

    return account
