require 'spec_helper'


require 'serverspec'
set :backend, :exec

describe "tyk-gateway" do
  it "has a service running" do
    expect(service("tyk-gateway")).to be_running
  end
  it "is listening on port 8080" do
    expect(port(8080)).to be_listening
  end
end
