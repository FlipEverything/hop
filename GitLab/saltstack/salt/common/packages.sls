brightbox_ppa_repository:
  pkgrepo.managed:
    - humanname: Brightbox PPA
    - ppa: brightbox/ruby-ng
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
      - git-core
      - postgresql
      - postgresql-client
      - libpq-dev
      - ruby2.1
      - ruby2.1-dev
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
install_golang:
  pkg.installed:
    - sources:
      - golang-doc: https://launchpad.net/ubuntu/+source/golang/2:1.5.1-0ubuntu2/+build/8131742/+files/golang-doc_1.5.1-0ubuntu2_all.deb
      - golang-src: https://launchpad.net/ubuntu/+source/golang/2:1.5.1-0ubuntu2/+build/8131742/+files/golang-src_1.5.1-0ubuntu2_amd64.deb
      - golang-go: https://launchpad.net/ubuntu/+source/golang/2:1.5.1-0ubuntu2/+build/8131742/+files/golang-go_1.5.1-0ubuntu2_amd64.deb
      - golang: https://launchpad.net/ubuntu/+source/golang/2:1.5.1-0ubuntu2/+build/8131742/+files/golang_1.5.1-0ubuntu2_all.deb
bundler:
  gem.installed:
    - ri: False
    - rdoc: False
