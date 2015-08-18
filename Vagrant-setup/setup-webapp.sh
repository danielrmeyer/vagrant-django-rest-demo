sudo apt-get update
sudo apt-get install python-pip
sudo apt-get install libpq-dev
sudo apt-get install python-dev
sudo pip install -r /vagrant/requirements.txt

cd /vagrant/rest_demo
python manage.py makemigrations snippets
python manage.py migrate
