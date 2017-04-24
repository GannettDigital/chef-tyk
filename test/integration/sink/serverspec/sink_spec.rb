require 'spec_helper'


require 'serverspec'
set :backend, :exec

describe "tyk-sink" do
#  First two test disabled until we can get a key we can commit for testing
#  it "has a service running" do
#    expect(service("tyk-sink")).to be_running
#  end

#  it "is listening on port 9090" do
#    expect(port(9090)).to be_listening
#  end

 # Firewall checks
  describe command('iptables-save'), if: iptables? do
    its(:stdout) { should contain '-A INPUT -p tcp -m tcp -m multiport --dports 9090 -m comment --comment "tyk-sink" -j ACCEPT' }
  end

  describe command('firewall-cmd --permanent --direct --get-all-rules'), if: firewalld? do
    its(:stdout) { should contain "ipv4 filter INPUT 50 -p tcp -m tcp -m multiport --dports 9090 -m comment --comment tyk-sink -j ACCEPT" }
  end

  describe file('/etc/rsyslog.d/tyk-sink.conf') do
    it { should be_file }
    it { should contain "if $programname == 'tyk-sink' then /var/log/tyk/tyk-sink.log" }
    it { should contain "& ~" }
  end

  describe file('/var/log/tyk/tyk-sink.log') do
    it { should be_file }
  end
end
