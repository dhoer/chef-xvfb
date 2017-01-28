# Xvfb Changelog

## 3.0.0 2017-01-27

- Drop support for Chef 11

## 2.1.1 2016-07-18

- Fix #4 Undefined method 'path_to' for Chef:Class in xvfb/libraries/default.rb

## 2.1.0 2016-06-23

- Add support for systemd

## 2.0.0 2015-02-16

- Address security vulnerability [CVE-1999-0526](http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-1999-0526) by
changing `args` default from `-ac` (disable access control restrictions) to `nil`

## 1.0.0 2014-12-16

- Refactor attributes names and document them in readme
