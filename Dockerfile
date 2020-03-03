# Imagem base
FROM ubuntu:18.04

# Mantido por
MAINTAINER Erivaldo Jr <eaojunior1@gmail.com>

# Labels
LABEL "br.com.agilcloud"="Squid Docker"
LABEL version="1.0.0"
LABEL description="Squid docker: \
Squid Ubuntu 18.04"

# Variavel
ENV DIR_BASE=/
ENV USERNAME="agilizeusr"
ENV PASSWORD="4G1l1z3UsR"

# Desabilitar funções de interação
ENV DEBIAN_FRONTEND=noninteractive

# Portas
EXPOSE 3128/tcp

RUN apt-get update -y
RUN apt-get install -y squid
RUN apt-get install -y apache2-utils
RUN apt-get clean

COPY entry.sh /
COPY squid.conf /etc/squid/squid.conf
RUN chmod a+x /entry.sh

RUN htpasswd -cb /etc/squid/passwd ${USERNAME} ${PASSWORD}

# Comando
ENTRYPOINT ["/entry.sh"]