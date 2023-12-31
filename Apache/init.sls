install_apache:
  pkg.installed:
  service.running:
    - pkg: apache
    - file: /etc/httpd/conf/httpd.conf
    - user: apache

user.present:
  - uid: 87
  - gid: 87
  - home: /var/www/html
  - shell: /bin/nologin
  - require:
      - group: apache
  group.present:
    - gid: 87
    - require:
      - pkg: apache
/etc/httpd/conf/httpd.conf:
  file.managed:
    - source: salt://apache/httpd.conf
    - user: root
    - group: root
    - mode: 644
    

     