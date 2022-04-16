# docker build . -t superset-run:1.0

# docker run -d -p 8080:8088 --name superset superset-run:1.0 


FROM apache/superset
# Switching to root to install the required packages
USER root
# Example: installing the MySQL driver to connect to the metadata database
# if you prefer Postgres, you may want to use `psycopg2-binary` instead
RUN pip install mysqlclient
# Example: installing a driver to connect to Redshift
# Find which driver you need based on the analytics database
# you want to connect to here:
# https://superset.apache.org/installation.html#database-dependencies
RUN pip install pip install "PyAthena[SQLAlchemy]>1.2.0, <2.0.0" 

# Switching back to using the `superset` user
USER superset

RUN superset fab create-admin \
               --username admin \
               --firstname Superset \
               --lastname Admin \
               --email admin@superset.com \
               --password admin
RUN superset db upgrade
RUN superset init
