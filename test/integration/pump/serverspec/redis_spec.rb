require 'spec_helper'


require 'serverspec'
set :backend, :exec

describe "redis" do
  it "is listening on port 6379" do
    expect(port(6379)).to be_listening
  end
end
