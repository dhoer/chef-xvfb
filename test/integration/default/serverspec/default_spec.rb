require 'serverspec'

set :backend, :exec

describe package('xvfb') do
  it { should be_installed }
end

describe service('xvfb') do
  it { should be_enabled }
end

describe service('xvfb') do
  it { should be_running }
end
