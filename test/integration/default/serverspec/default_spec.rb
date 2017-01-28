require 'spec_helper'

unless os[:family] == 'debian'
  describe service('xvfb') do
    it { should be_enabled }
  end

  describe service('xvfb') do
    it { should be_running }
  end
end
