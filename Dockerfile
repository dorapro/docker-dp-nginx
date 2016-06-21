FROM nginx:1.10-alpine

ADD https://github.com/progrium/entrykit/releases/download/v0.4.0/entrykit_0.4.0_Linux_x86_64.tgz /tmp/entrykit.tgz
RUN tar -xzf /tmp/entrykit.tgz -C /bin entrykit \
    && entrykit --symlink \
    && true

COPY conf.d/default.conf.tmpl /etc/nginx/conf.d/default.conf.tmpl

ENTRYPOINT ["render", "/etc/nginx/conf.d/default.conf", "--", "/usr/sbin/nginx"]
CMD ["-g", "daemon off;"]
