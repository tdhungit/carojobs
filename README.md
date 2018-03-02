# [CaroJobs][docs]

# Requirement
* Python (2.7, 3.2, 3.3, 3.4, 3.5)
* Django (1.8, 1.9, 1.10)

# Install
* pip install -r requirements.txt
* git clone <link bitbucket>
* go to root app
* setup database (mysql): carojob/settings.py --> DATABASE = {
* python manage.py migrate
* python manage.py createsuperuser
* python manage.py runserver
* Or get example database from ./recruitment/dev/
* In Windows please install MySQL-python from ./recruitment/dev/

# Test API
* http://127.0.0.1:8000

# Auth
* Login to Admin: http://127.0.0.1:8000/administrator
* Create Application: http://127.0.0.1:8000/auth/applications
* Client type: Live:confidential, Dev:Public
* Authorization Grant Type: Password

# Auth Example
# Get token
* Post: http://127.0.0.1:8000/auth/token/
* grant_type: password
* client_id: <client_id>
* client_secret: <client_secret>
* username: <username>
* password: <password>

