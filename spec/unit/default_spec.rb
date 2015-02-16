require 'spec_helper'

describe 'xvfb::default' do
  context 'rhel' do
    let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'fedora', version: '20').converge(described_recipe) }

    it 'installs package' do
      expect(chef_run).to install_package('xorg-x11-server-Xvfb')
    end

    it 'installs init.d' do
      expect(chef_run).to create_template('/etc/init.d/xvfb').with(
        source: 'rhel.erb',
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

  context 'debian' do
    let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '14.04').converge(described_recipe) }

    it 'installs package' do
      expect(chef_run).to install_package('xvfb')
    end

    it 'installs init.d' do
      expect(chef_run).to create_template('/etc/init.d/xvfb').with(
        source: 'debian.erb',
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
end
