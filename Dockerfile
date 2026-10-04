FROM debian:trixie

RUN apt-get update \
    && apt-get install -y apache2 \
    && rm -rf /var/lib/apt/lists/*

COPY meu_site.tar /tmp/meu_site.tar

RUN rm -rf /var/www/html/* \
    && tar -xf /tmp/meu_site.tar -C /var/www/html \
    && rm /tmp/meu_site.tar

EXPOSE 80

CMD ["apache2ctl", "-D", "FOREGROUND"]
