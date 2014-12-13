include_recipe 'apt' if platform_family?('debian')
include_recipe 'yum' if platform_family?('rhel', 'fedora')

include_recipe 'xvfb'
