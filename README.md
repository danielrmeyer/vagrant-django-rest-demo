# vagrant-django-rest-demo
Demonstrate vagrant multi-machine setup with postgres db and django rest api.  Personal experimentation.

To run the demo:

1. Install vagrant and virtualbox.

2. clone this repository.

3. $ cd <path>/vagrant-django-rest-demo

4. $ vagrant up

5. $ vagrant ssh web

6. $ cd /vagrant/rest_demo

7. $ python manage.py migrate

8. $ python manage.py createsuperuser

9. $ sudo python manage.py runserver 0.0.0.0:80
