VHOST=$(cat <<EOF
<VirtualHost *:80>
    UseCanonicalName Off
    VirtualDocumentRoot /var/www/%1/httpdocs
    <Directory /var/www/%1>
        Options FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>
EOF
)
echo "${VHOST}" > /etc/apache2/sites-available/000-default.conf

sudo a2enmod vhost_alias

service apache2 restart