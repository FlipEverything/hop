postgresql_database:
  postgres_user.present:
    - name: git
    - createdb: True
  postgres_database.present:
    - name: gitlab
    - owner: git
