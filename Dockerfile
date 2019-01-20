FROM registry.access.redhat.com/rhscl/php-71-rhel7
# Install Apache httpd and PHP
RUN yum install -y yum-utils && \
    prepare-yum-repositories rhel-server-rhscl-7-rpms && \
    INSTALL_PKGS="rh-php71 rh-php71-php rh-php71-php-mysqlnd rh-php71-php-pgsql rh-php71-php-bcmath \
                  rh-php71-php-gd rh-php71-php-intl rh-php71-php-ldap rh-php71-php-mbstring rh-php71-php-pdo \
                  rh-php71-php-process rh-php71-php-soap rh-php71-php-opcache rh-php71-php-xml \
                  rh-php71-php-gmp rh-php71-php-pecl-apcu httpd24-mod_ssl" && \
    yum install -y --setopt=tsflags=nodocs $INSTALL_PKGS && \
    rpm -V $INSTALL_PKGS && \
    yum clean all -y
