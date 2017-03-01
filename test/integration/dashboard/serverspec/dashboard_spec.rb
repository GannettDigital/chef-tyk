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

 # Firewall checks
  describe command('iptables-save'), if: iptables? do
    its(:stdout) { should contain '-A INPUT -p tcp -m tcp -m multiport --dports 3000 -m comment --comment "tyk-dashboard" -j ACCEPT' }
  end

  describe command('firewall-cmd --permanent --direct --get-all-rules'), if: firewalld? do
    its(:stdout) { should contain "ipv4 filter INPUT 50 -p tcp -m tcp -m multiport --dports 3000 -m comment --comment tyk-dashboard -j ACCEPT" }
  end

  describe file('/etc/rsyslog.d/tyk-analytics.conf') do
    it { should be_file }
    it { should contain "if $programname == 'tyk-analytics' then /var/log/tyk/tyk-analytics.log" }
  end

  describe file('/var/log/tyk/tyk-analytics.log') do
    it { should be_file }
  end
end
