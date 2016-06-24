name 'xvfb'
maintainer 'Dennis Hoer'
maintainer_email 'dennis.hoer@gmail.com'
license 'MIT'
description 'Installs/Configures Xvfb as a Service'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
source_url 'https://github.com/dhoer/chef-xvfb' if respond_to?(:source_url)
issues_url 'https://github.com/dhoer/chef-xvfb/issues' if respond_to?(:issues_url)
version '2.1.0'

supports 'debian'
supports 'centos'
supports 'fedora'
supports 'redhat'
supports 'ubuntu'

depends 'apt'
depends 'yum'
