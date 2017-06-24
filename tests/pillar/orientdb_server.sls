orientdb:
  environment:
    version: 2.2-alpha
    user: orientdb
    group: orientdb
    java_max_heap: 2g
  server:
    enabled: true
    automatic_backup:
      enabled: false
      delay: 4h
      first_time: 04:00:00
      directory: backup
      compression_level: 9
      db_include: ''
      db_exclude: ''
    script_interpreter:
      enabled: true
      allowed_languages: SQL
    token_handler:
      enabled: false
      oauth2_key: ''
      session_length: 60
      algorithm: HmacSHA256
    live_query:
      enabled: false
    ssl:
      client_auth: false
      key_store: config/cert/orientdb.ks
      key_store_password: password
      trust_store: config/cert/orientdb.ks
      trust_store_password: password
    https:
      client_auth: false
      key_store: config/cert/orientdb.ks
      key_store_password: password
      trust_store: config/cert/orientdb.ks
      trust_store_password: password
    protocol:
      binary:
        enabled: true
        ip_address: 0.0.0.0
        port_range: 2424-2430
      binary_ssl:
        enabled: false
        ip_address: 0.0.0.0
        port_range: 2434-2440
      http:
        enabled: true
        ip_address: 0.0.0.0
        port_range: 2480-2490
        enable_xss: false
    db:
      pool:
        min: 1
        max: 50
    profiler:
      enabled: true
    log:
      console:
        enabled: true
        level: info
      file:
        enabled: true
        level: fine
    users:
      - name: root
        password: toor
        resources: '*'