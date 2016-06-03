require 'spec_helper'

require 'serverspec'
set :backend, :exec

describe "tyk-dashboard" do
  it "has a service running" do
    expect(service("tyk-dashboard")).to be_running
  end
  it "is listening on port 3000" do
    expect(port(3000)).to be_listening
  end
end
