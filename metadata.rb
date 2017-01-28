name 'xvfb'
maintainer 'Dennis Hoer'
maintainer_email 'dennis.hoer@gmail.com'
license 'MIT'
description 'Installs/Configures Xvfb as a Service'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
source_url 'https://github.com/dhoer/chef-xvfb'
issues_url 'https://github.com/dhoer/chef-xvfb/issues'
version '3.0.0'

chef_version '>= 12.14'

supports 'debian'
supports 'centos'
supports 'fedora'
supports 'redhat'
supports 'ubuntu'
