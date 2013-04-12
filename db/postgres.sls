postgres-packages:
  pkg.installed:
    - names:
      - postgresql-9.1
      - postgresql-client-9.1
      - postgresql-plpython-9.1
      - postgresql-server-dev-9.1

postgresql:
  service:
    - running
    - enable: True
