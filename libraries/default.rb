def xvfb_systype
  return 'systemd' if ::File.exist?(Chef.path_to('/proc/1/comm')) &&
                      ::File.open(Chef.path_to('/proc/1/comm')).gets.chomp == 'systemd'
  return 'upstart' if platform_family?('debian') && ::File.exist?(Chef.path_to('/sbin/initctl'))
  'sysvinit'
end
