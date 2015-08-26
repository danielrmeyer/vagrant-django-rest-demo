# vagrant-django-rest-demo
Demonstrate vagrant multi-machine setup with postgres db and django rest api.  

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

On host machine visit http://localhost:8000 in your browser.

Thanks to http://www.django-rest-framework.org/ for the great tutorial which I used to get this example going.
Also, thanks to https://github.com/jackdb/pg-app-dev-vm for the postgres provisioning script.

To create a staging environment with aws using this demo:

Do the following pre-steps on your machine:
```
$ vagrant plugin install vagrant-aws
$ vagrant box add dummy https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box
```
I assume you are familier with aws console.  If not spend a bit of time
generating your keys and and install the aws-cli.

1. $ vagrant destroy

2. Create a shell script to set-up your aws stuff:

```
export AWS_KEY=###############
export AWS_SECRET=#############################
export AWS_KEYNAME="my_key"
export AWS_KEYPATH=/Users/myname/.secret_folder/test.pem
```

3. In the aws console create security groups for your db and webapp
and modify the vagrantfile to reflect that.  For the db your security
group must open up ssh and the postgres port 5432.  For the webapp
you will need ssh and http (port 80).

4. $ vagrant up --provider=aws

5. $ vagrant ssh web

6. $ cd /vagrant/rest_demo

7. In the console figure out the private IP address of the database host.
When you know this use nano or other text editor to open:

nano /vagrant/rest_demo/rest_demo/setting.py.

Change the DB host to reflec the private IP address found from the console.

8. Now follow steps 7, 8 and 9 to migrate the db, create the superuser and
run the web application.

9. Find the public IP of your webapp in the aws console and visit:
http://<public_ip>

10. Enjoy!
