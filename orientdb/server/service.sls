{%- from "orientdb/map.jinja" import environment,server with context %}
{%- if server.enabled %}

orientdb_service_enable:
  service.enabled:
    - name: orientdb
    - enabled: True

orientdb_service_manage:
  service.running:
    - name: orientdb
    - enable: True
    - watch:
      - file: {{environment.install_dir}}/config/orientdb-server-config.xml

{%- endif %}