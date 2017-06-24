{%- from "orientdb/map.jinja" import server,environment with context %}
{%- if server.enabled %}

{{ environment.prefix }}:
  file.directory:
  - user: {{environment.user}}
  - group: {{environment.group}}
  - mode: 755
  - makedirs: True

orientdb_unpack_source:
  cmd.run:
    - name: curl '{{ environment.source_url }}' | tar xz --no-same-owner
    - cwd: {{ environment.prefix }}
    - unless: test -d {{ environment.install_dir }}
    - require:
      - file: {{ environment.prefix }}

{{ environment.install_dir }}:
  file.directory:
  - user: {{environment.user}}
  - group: {{environment.group}}
  - mode: 755
  - makedirs: False
  - require:
    - cmd: orientdb_unpack_source

orientdb_service_install:
  file.managed:
  - name: /etc/systemd/system/orientdb.service
  - source: salt://orientdb/files/orientdb.service
  - user: root
  - group: root
  - mode: 644
  - template: jinja
  - require:
    - cmd: orientdb_unpack_source

{%- endif %}