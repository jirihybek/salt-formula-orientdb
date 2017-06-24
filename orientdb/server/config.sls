{%- from "orientdb/map.jinja" import environment,server with context %}
{%- if server.enabled %}

orientdb_server_config:
  file.managed:
  - name: {{environment.install_dir}}/config/orientdb-server-config.xml
  - source: salt://orientdb/files/orientdb-server-config.xml
  - user: environment.user
  - group: environment.group
  - mode: 644
  - template: jinja

orientdb_server_start_script:
  file.managed:
  - name: {{environment.install_dir}}/bin/server.sh
  - source: salt://orientdb/files/server.sh
  - user: environment.user
  - group: environment.group
  - mode: 755
  - template: jinja

{%- endif %}