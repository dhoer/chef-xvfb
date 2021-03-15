case xvfb_systype
when 'systemd'
  path = '/etc/systemd/system/xvfb.service'
  src = 'systemd.erb'
  mode = '0644'
when 'upstart'
  path = '/etc/init/xvfb.conf'
  src = 'upstart.erb'
  mode = '0644'
else
  path = '/etc/init.d/xvfb'
  src = 'sysvinit.erb'
  mode = '0755'
end

template path do
  source src
  mode mode
  variables(
    display: node['xvfb']['display'],
    screennum: node['xvfb']['screennum'],
    dimensions: node['xvfb']['dimensions'],
    args: node['xvfb']['args']
  )
  notifies(:reload, 'service[xvfb]')
  notifies(:restart, 'service[xvfb]')
end

service 'xvfb' do
  action %i[enable start]
  if xvfb_systype == 'systemd'
    reload_command 'systemctl daemon-reload'
  end
end
