# CHANGELOG

## 0.1.24

* modified **download** resource to use **curl** instead of **wget**

## 0.1.23

* simplified **eypconf** fact generation

## 0.1.22

* added **eypconf_location**
* added **eypconf_sg** fact (servergroup shortname)

## 0.1.21

* added double empty line at the end of the autobanner file

## 0.1.20

* changed banner for puppet managed server

## 0.1.19

* bugfix **eyplib::autobanner**

## 0.1.18

* added fact **eypconf_description**
* added **eyplib::setdescription** fet setting **eypconf_description**
* added **eyplib::autobanner** intended for generating a SSH banner file

## 0.1.17

* renamed unused facts

## 0.1.16

* added **pdbtest** plan  for puppet bolt

## 0.1.15

* added **retcode2bool** function

## 0.1.14

* added **eypconf_projectid**

## 0.1.12

* added **yesno2bool** function

## 0.1.11

* added **git clone** type to clone repos

## 0.1.10

* added **eypconf_servergroup** fact
* added **download** type to download files checking if the resulting file is empty

## 0.1.9

* removed **bool2httpd** function

## 0.1.8

* added **eypconf** facts
