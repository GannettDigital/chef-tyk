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

  describe file('/etc/rsyslog.d/tyk.conf') do
    it { should be_file }
    it { should contain "if $programname == 'tyk' then /var/log/tyk/tyk.log" }
  end

  describe file('/var/log/tyk/tyk.log') do
    it { should be_file }
  end

 # Firewall checks
  describe command('iptables-save'), if: iptables? do
    its(:stdout) { should contain '-A INPUT -p tcp -m tcp -m multiport --dports 8080 -m comment --comment "tyk-gateway" -j ACCEPT' }
  end

  describe command('firewall-cmd --permanent --direct --get-all-rules'), if: firewalld? do
    its(:stdout) { should contain "ipv4 filter INPUT 50 -p tcp -m tcp -m multiport --dports 8080 -m comment --comment tyk-gateway -j ACCEPT" }
  end
end
