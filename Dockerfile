FROM python:2.7.14
MAINTAINER Jeff Cousineau "cousinea@umich.edu"

RUN apt-get update -y

WORKDIR /app

COPY . .

RUN pip install -r requirements.txt

#RUN chown -R www-data /app
#USER www-data
RUN chmod g+r -R wsgi.py ./welcome

EXPOSE 8000

CMD ["gunicorn", "-c", "guniconf", "wsgi:application"]
