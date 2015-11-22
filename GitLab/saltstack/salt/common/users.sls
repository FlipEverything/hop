gitlab_user:
  user.present:
    - name : git
    - fullname: GitLab
    - shell: /bin/false
    - home: /home/git
    - createhome: True
    - system: True
    - empty_password: True
    - groups:
      - redis
