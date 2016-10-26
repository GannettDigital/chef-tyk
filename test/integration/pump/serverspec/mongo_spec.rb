require 'spec_helper'


require 'serverspec'
set :backend, :exec

describe "mongodb" do
  it "is listening on port 27017" do
    expect(port(27017)).to be_listening
  end
end
