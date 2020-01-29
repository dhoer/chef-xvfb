require 'spec_helper'

describe 'xvfb::default' do
  context 'sysvinit' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'centos', version: '6.9') do
        allow_any_instance_of(Chef::Recipe).to receive(:xvfb_systype).and_return('sysvinit')
      end.converge(described_recipe)
    end

    it 'installs package' do
      expect(chef_run).to install_package('xorg-x11-server-Xvfb')
    end

    it 'installs sysvinit' do
      expect(chef_run).to create_template('/etc/init.d/xvfb').with(
        source: 'sysvinit.erb',
        mode: '0755',
        variables: {
          display: ':0',
          screennum: '0',
          dimensions: '1280x1024x24',
          args: nil
        }
      )
    end

    it 'starts xvfb service' do
      expect(chef_run).to start_service('xvfb')
    end
  end

  context 'upstart' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '14.04') do
        allow_any_instance_of(Chef::Recipe).to receive(:xvfb_systype).and_return('upstart')
      end.converge(described_recipe)
    end
    it 'installs package' do
      expect(chef_run).to install_package('xvfb')
    end

    it 'installs upstart' do
      expect(chef_run).to create_template('/etc/init/xvfb.conf').with(
        source: 'upstart.erb',
        mode: '0644',
        variables: {
          display: ':0',
          screennum: '0',
          dimensions: '1280x1024x24',
          args: nil
        }
      )
    end

    it 'starts xvfb service' do
      expect(chef_run).to start_service('xvfb')
    end
  end

  context 'systemd' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'centos', version: '7.5.1804') do
        allow_any_instance_of(Chef::Recipe).to receive(:xvfb_systype).and_return('systemd')
      end.converge(described_recipe)
    end

    it 'installs package' do
      expect(chef_run).to install_package('xorg-x11-server-Xvfb')
    end

    it 'installs systemd' do
      expect(chef_run).to create_template('/etc/systemd/system/xvfb.service').with(
        source: 'systemd.erb',
        mode: '0644',
        variables: {
          display: ':0',
          screennum: '0',
          dimensions: '1280x1024x24',
          args: nil
        }
      )
    end

    it 'starts xvfb service' do
      expect(chef_run).to start_service('xvfb')
    end
  end
end
