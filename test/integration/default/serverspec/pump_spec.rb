require 'spec_helper'


require 'serverspec'
set :backend, :exec

describe "tyk-pump" do
  it "has a service running" do
    expect(service("tyk-pump")).to be_running
  end
  it "is listening on port 8080" do
    expect(port(8080)).to be_listening
  end
end
