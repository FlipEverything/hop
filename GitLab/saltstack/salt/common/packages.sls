install_system_packages:
  pkg.installed:
    - pkgs:
      - python-software-properties
brightbox_ppa_repository:
  pkgrepo.managed:
    - ppa: brightbox/ruby-ng
ubuntu_lxc_ppa_repository:
  pkgrepo.managed:
    - ppa: ubuntu-lxc/lxd-stable
remove_packages:
  pkg.purged:
    - pkgs:
      - ruby
      - ruby-dev
      - postgresql
      - postgresql-client
      - libpq-dev
      - ruby1.9.1
      - ruby1.9.1-dev
      - ruby2.1
      - ruby2.1-dev
      - golang
      - redis-server
      - nodejs
      - nginx
apt-get -y autoremove --purge:
  cmd.run:
    - user: root
install_packages:
  pkg.installed:
    - pkgs:
      - htop
      - strace
      - ca-certificates
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
      - libxslt1-dev
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
