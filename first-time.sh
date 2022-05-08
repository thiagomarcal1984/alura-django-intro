# Este script deve ser executado logo as máquinas estiverem prontas.

echo "Criando as migrações."
python manage.py makemigrations

echo "Migrando..."
python manage.py migrate

echo "Criando o super usuário."
python manage.py createsuperuser --noinput

# gunicorn alurareceita.wsgi --bind 0.0.0.0:80