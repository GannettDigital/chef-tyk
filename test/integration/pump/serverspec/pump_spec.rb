require 'spec_helper'


require 'serverspec'
set :backend, :exec

describe "tyk-pump" do
  it "has a service running" do
    expect(service("tyk-pump")).to be_running
  end

  describe file('/etc/rsyslog.d/tyk-pump.conf') do
    it { should be_file }
    it { should contain "if $programname == 'tyk-pump' then /var/log/tyk/tyk-pump.log" }
  end

  describe file('/var/log/tyk/tyk-pump.log') do
    it { should be_file }
  end
end
