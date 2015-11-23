# GitLab telepitese SaltStackel

Ez a repo a Szegedi Tudomanyegyetem Halozati Operacios Rendszerek (HOP) gyakorlati kurzusara keszult projektmunkat tartalmazza. A GitLab rendszer telepiteset vegeztuk el SaltStackel.

**Keszitette:**
 - Dobo Laszlo (GitLab mappa)
 - Maroy Andras (OpenStack mappa)

## 1. Elofeltetelek

### 1.1. Kulonallo VirtualBox gepre valo telepites eseten
 - [VirtualBox](https://www.virtualbox.org/)
 - [Vagrant](https://www.vagrantup.com/)
 - [Salty Vagrant Grains](https://github.com/ahmadsherif/salty-vagrant-grains)

### 1.2. OpenStackbe valo telepites eseten
WIP
 - [Vagrant OpenStack Provider](https://github.com/cloudbau/vagrant-openstack-plugin)

## 2. Telepites

### 2.1. GitLab telepitese kulonallo VirtualBox gepre

```sh
:~$ cd [git-repo]/GitLab
:~$ vagrant up --provider=virtualbox
```

Ez a parancs letrehoz egy, a Vagrantfile-ban definialt VirtualBox VM-et, "GitLab" nevvel. A gep letrehozasa utan elindul a provision folyamat, amely a SaltStack-et hasznalva, az elore definialt utasitasokkal feltelepiti a GitLab-ot a VM-re.

A telepitesi folyamat a [hivatalos GitLab dokumentacio](https://github.com/gitlabhq/gitlabhq/blob/master/doc/install/installation.md) alapjan hajtodik vegre.

### 2.2. OpenStack telepites kulonallo VirtualBox gepre

**Fontos a futtatashoz szukseg van egy vagrant pluginre:**
```sh
vagrant plugin install salty-vagrant-grains
```

Ezutan:

```sh
:~$ cd [git-repo]/OpenStack
:~$ vagrant up --provider=virtualbox
```

Ez a parancs letrehoz egy, a Vagrantfile-ban definialt VirtualBox VM-et, "OpenStack" nevvel. A gep letrehozasa utan elindul a provision folyamat, amely a SaltStack-et hasznalva, az elore definialt utasitasokkal feltelepiti az OpenStack-et a VM-re.

A telepitesi folyamat a [DevStack script](http://docs.openstack.org/developer/devstack) segitsegevel tortenik.

### 2.3. GitLab telepitese OpenStackbe

WIP

## 3. Konfiguracio

### 3.1. GitLab
A GitLab SaltStack konfiguracios fajl a kovetkezo eleresi uton talalhato:

```sh
[git-repo]/GitLab/saltstack/pillar/config.sls
```

A konfiguracios fajlban a kovetkezo beallitasi lehetosegek allnak rendelkezesre:

```yaml
config:
  lookup:
    db_key_base:
      production: FcC.Pqm3g~.=vx?dEe,>YcU'.(W@DX3[QX3/35"c
      development: development
      test: test
    nginx:
      fqdn: gitlab-test.dev
    gitlab:
      root_password: valami!biztonsagos2015
```
### 3.2. Vagrant

A VirtualBox VM konfiguracioja a kovetkezo fajlban erheto el:

```sh
[git-repo]/GitLab/Vagrantfile
```

A ket legfontosabb konfiguralasi lehetoseg:

```sh
config.vm.provider
config.vm.network
```

A **config.vm.provider** valtozoban a letrejovo gep hardware konfiguraciojat tudjuk allitani. A **config.vm.network**-ben pedig a halozati interfeszt, mely jelenleg egy nyilvanos, bridgelt kartya lesz, mely a hoszt gep halozatara fog kapcsolodni a megadott halozati kartyan keresztul, ami aktualisan a "Realtek PCIe GBE Family Controller" eszkoz. Van lehetoseg fix IP cim megadasara is (pl.: 192.168.0.17).

### 3.3 OpenStack

A konfiguraciohoz szukseges valtozok a [minion file](OpenStack/saltstack/etc/minion)-ban vannak leirva

Itt az alabbi valtozok allitasara van lehetoseg:
```yaml
  admin_pw: hop     # Admin jelszo
  db_pw: hop        # Adatbazis jelszo
  rabbit_pw: hop    # RabbitMQ jelszo
  svc_pw: hop       # Service jelszo
  floating_range: 172.24.4.0/24     # A VM-ek kivolrol elerheto cimtartomanya
  token: a682f596-76f3-11e3-b3b2-e716f9080d50   # Authentikacios token
```

Tovabba a [Vagrantfile](OpenStack/Vagrantfile)-ban talalhatoak meg fontos beallitasok:
```ruby
  # Ezen a cimen lehet majd elerni az OpenStack-et
  config.vm.network :private_network, ip: "192.168.27.100"
  # Az itt megadott ip cimnek a lentebbi 'floating_range' tartomanyba kell esnie!
  config.vm.network :private_network, ip: "172.24.4.225", :netmask => "255.255.255.0", :auto_config => false

  config.vm.provider :virtualbox do |vb|
    vb.memory = 8196
    vb.cpus = 4
  # ...

  config.vm.provision :salt do |salt|
    # ...
    salt.grains({
      # Ebben a tartomanyban lesznek elerhetoek az OpenStack-ben letrehozott virtualis gepeink
      floating_range: '172.24.4.0/24'
    # ...
```

## 4. Futtatas

A Vagrantfile-ban megadott IP cimen es az FQDN-en, bongeszobol erhetjuk el:

```sh
# GitLab:
http://192.168.0.17
http://gitlab-test.dev

# OpenStack:
http://192.168.27.100/dashboard
```
Megj: a megfelelo /etc/host vagy DNS szerver rekordot letre kell hoznunk.


```sh
# GitLab:
Felhasznalonev: root
Jelszo: a config.sls-ben megadott

# OpenStack
Felhasznalonev: admin / demo
Jelszo: a config.sls-ben megadott
```

Kepernyokep:
![alt text](screenshot.png "Kepernyokep")
