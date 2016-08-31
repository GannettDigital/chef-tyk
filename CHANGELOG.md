tyk CHANGELOG
=============

This file is used to list changes made in each version of the tyk cookbook.

0.2.6
-----
- Marcelo Mandolesi - PAAS-1806 increasing open file limit on gateways for CentOS7 via service file

0.2.5
-----
- Marcelo Mandolesi - PAAS-1806 increasing open file limit on gateways

0.2.4
-----
- Jason Neves - added params for specifying package source, added new elements for ui langnage config

0.2.3
-----
- Jason Neves - corrected config for pump and updated tests accordingly

0.2.2
-----
- Jason Neves - additional firewall rules and tests for tyk-pump

0.2.1
-----
- Jason Neves - firewall rules, additional tests

0.2.0
-----
- Jason Neves - Updated attributes to support newer version of Tyk (2.0)
  Updated serverspec testing and added spec tests
  Added to support tyk-pump module for analytics

0.1.2
-----
- Fix configuration attributes for dashboard

0.1.1
-----
- Fix service reload, on some platforms it is not available, so use restart instead.

0.1.0
-----
- Initial release of tyk cookbook
