# Execução do Apache Superset com adição do driver para AWS Athena
# IGTI - MBA Engenharia de Dados
# Projeto Aplicado Repositório de Logs, Sprint 3
# Aluno: Anderson Luis do Espirito Santo
# Orientador: Guilherme Noronha
#
# Instruções:
# Linha de comando para construção do container
# docker build . -t superset-run:1.0
#
# Linha de comando para execução do container
# docker run -d -p 8080:8088 --name superset superset-run:1.0 

# Container de origem
FROM apache/superset

USER root
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
