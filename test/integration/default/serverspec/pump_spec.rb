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

 # Firewall checks
  describe command('iptables-save'), if: iptables? do
    its(:stdout) { should contain '-A INPUT -p tcp -m tcp -m multiport --dports 8080 -m comment --comment "tyk-pump" -j ACCEPT' }
  end

  describe command('firewall-cmd --permanent --direct --get-all-rules'), if: firewalld? do
    its(:stdout) { should contain "ipv4 filter INPUT 50 -p tcp -m tcp -m multiport --dports 8080 -m comment --comment tyk-pump -j ACCEPT" }
  end
end
