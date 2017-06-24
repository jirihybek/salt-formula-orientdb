{%- from "orientdb/map.jinja" import environment,server with context %}
{%- if server.enabled %}

orientdb_server_config:
  file.managed:
  - name: {{environment.install_dir}}/config/orientdb-server-config.xml
  - source: salt://orientdb/files/orientdb-server-config.xml
  - user: {{environment.user}}
  - group: {{environment.group}}
  - mode: 644
  - template: jinja

orientdb_server_script_server.sh_heap:
  file.replace:
  - name: {{environment.install_dir}}/bin/server.sh
  - pattern: 'MAXHEAP=[0-9a-zA-Z-]*'
  - repl: 'MAXHEAP=-Xmx{{environment.java_max_heap}}'

orientdb_server_script_server.sh_env:
  file.line:
  - name: {{environment.install_dir}}/bin/server.sh
  - content: ". /etc/profile"
  - mode: ensure
  - before: 'echo'

{%- endif %}