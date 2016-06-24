#!/bin/sh
describe "xvfb"
  it "should start the service"
    ps ax | grep [X]vfb
    assert equal "$?" 0
  end
end
