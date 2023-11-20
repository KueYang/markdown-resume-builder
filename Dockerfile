# Reference: https://stackoverflow.com/questions/56426050/how-to-install-wkhtmltopdf-on-docker-php-fpm-alpine-linux

FROM surnet/alpine-wkhtmltopdf:3.16.2-0.12.6-full as wkhtmltopdf

# or use pandoc/latex:latest ? not necessary for vanilla usage at least
# you just need to inherit from us so that you have pandoc available
FROM pandoc/latex:latest

# Install wkhtmltopdf
RUN apk add --no-cache \
        libstdc++ \
        libx11 \
        libxrender \
        libxext \
        libssl1.1 \
        ca-certificates \
        fontconfig \
        freetype \
        ttf-droid \
        ttf-freefont \
        ttf-liberation \
        # more fonts
        ;

# wkhtmltopdf copy bins from ext image
COPY --from=wkhtmltopdf /bin/wkhtmltopdf /bin/libwkhtmltox.so /bin/