name 'tyk'
maintainer 'Gannett Co., Inc'
maintainer_email 'paas-delivery@gannett.com'
license ' Copyright (c) 2016 Gannett Co., Inc, All Rights Reserved.'
description      'Installs/Configures tyk'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.4.2'

%w( debian ubuntu centos redhat fedora scientific oracle ).each do |os|
  supports os
end

source_url 'https://github.com/GannettDigital/chef-tyk'
issues_url 'https://github.com/GannettDigital/chef-tyk/issues'

depends 'packagecloud', '~> 0.2.0'
depends 'redisio', '~> 2.4.0'
depends 'mongodb', '~> 0.16.3'
depends 'firewall'
depends 'sysctl'
depends 'limits'
depends 'ark', '~> 0.9.0'
