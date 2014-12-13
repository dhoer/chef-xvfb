#!/bin/sh
describe "xvfb package"
  it "should be installed"
    if [ -e /usr/bin/dpkg ]; then
      dpkg -s xvfb
    elif [ -e /usr/bin/rpm ]; then
      rpm -qa | grep Xvfb
    fi
    assert equal "$?" 0
  end
end
