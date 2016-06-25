require 'serverspec'

set :backend, :exec

describe service('xvfb') do
  it { should be_enabled }
end

describe service('xvfb') do
  it { should be_running }
end
