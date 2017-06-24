{%- from "orientdb/map.jinja" import server with context %}
{%- if server.enabled %}

orientdb_service_enable:
  service.enabled:
    - name: orientdb
    - enabled: True

orientdb_service_manage:
  service.running:
    - name: orientdb
    - enable: True

{%- endif %}