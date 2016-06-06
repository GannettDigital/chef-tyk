require 'spec_helper'


require 'serverspec'
set :backend, :exec

describe "tyk-pump" do
  it "has a service running" do
    expect(service("tyk-pump")).to be_running
  end
end
