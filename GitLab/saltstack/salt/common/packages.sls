brightbox_ppa_repository:
  pkgrepo.managed:
    - humanname: Brightbox PPA
    - ppa: brightbox/ruby-ng
evarlast_golang15_ppa_repository:
  pkgrepo.managed:
    - humanname: Everlast golang1.5 PPA
    - ppa: evarlast/golang1.5
    - dist: trusty
evarlast_golang14_ppa_repository:
  pkgrepo.managed:
    - humanname: Everlast golang1.4 PPA
    - ppa: evarlast/golang1.4
    - dist: trusty
remove_packages:
  pkg.purged:
    - pkgs:
      - ruby1.9.1
install_packages:
  pkg.installed:
    - pkgs:
      - htop
      - strace
      - ca-certificates
      - postfix
      - python-software-properties
      - git-core
      - postgresql
      - postgresql-client
      - libpq-dev
      - ruby2.1
      - ruby2.1-dev
      - golang
      - build-essential
      - zlib1g-dev
      - libyaml-dev
      - libssl-dev
      - libgdbm-dev
      - libreadline-dev
      - libncurses5-dev
      - libffi-dev
      - curl
      - openssh-server
      - redis-server
      - checkinstall
      - libxml2-dev
      - libxslt-dev
      - libcurl4-openssl-dev
      - libicu-dev
      - logrotate
      - python-docutils
      - pkg-config
      - cmake
      - nodejs
      - nginx
bundler:
  gem.installed:
    - ri: False
    - rdoc: False
