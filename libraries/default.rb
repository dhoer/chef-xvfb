def xvfb_systype
  return 'systemd' if ::File.exist?(Chef.path_to('/proc/1/comm')) &&
                      ::File.open(Chef.path_to('/proc/1/comm')).gets.chomp == 'systemd'
  return 'upstart' if ::File.exist?(Chef.path_to('/sbin/initctl'))
  'sysvinit'
end
