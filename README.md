# GitLab telepitese SaltStackel

Ez a repo a Szegedi Tudomanyegyetem Halozati Operacios Rendszerek (HOP) gyakorlati kurzusara keszult projektmunkat tartalmazza. A GitLab rendszer telepiteset vegeztuk el SaltStackel.

**Keszitette:**
 - Dobo Laszlo (GitLab mappa)
 - Maroy Andras (OpenStack mappa)

## 1. Elofeltetelek

### 1.1. Kulonallo VirtualBox gepre valo telepites eseten
 - [VirtualBox](https://www.virtualbox.org/)
 - [Vagrant](https://www.vagrantup.com/)

### 1.2. OpenStackbe valo telepites eseten

WIP

## 2. Telepites

### 2.1. GitLab telepitese kulonallo VirtualBox gepre

```sh
:~$ cd [git-repo]/GitLab
:~$ vagrant up
```

Ez a parancs letrehoz egy, a Vagrantfile-ban definialt VirtualBox VM-et, "GitLab" nevvel. A gep letrehozasa utan elindul a provision folyamat, amely a SaltStack-et hasznalva, az elore definialt utasitasokkal feltelepiti a GitLab-ot a VM-re.

A telepitesi folyamat a [hivatalos GitLab dokumentacio](https://github.com/gitlabhq/gitlabhq/blob/master/doc/install/installation.md) alapjan hajtodik vegre.

### 2.2. GitLab telepitese OpenStackbe

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

WIP


## 4. Futtatas

A Vagrantfile-ban megadott IP cimen es az FQDN-en, bongeszobol erhetjuk el:

```sh
http://192.168.0.17
http://gitlab-test.dev
```
Megj: a megfelelo /etc/host vagy DNS szerver rekordot letre kell hoznunk.


```sh
Felhasznalonev: root
Jelszo: a config.sls-ben megadott
```

Kepernyokep:
![alt text](screenshot.png "Kepernyokep")
