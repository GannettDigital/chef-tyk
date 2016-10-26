tyk Cookbook
============

Install and configure Tyk API gateway (https://tyk.io)

## Usage

- For a testing installation, just add the `tyk::default` recipe to your 
runlist. It will install Redis, Mongo, Tyk Gateway and Tyk Dashboard on the
node. You have to bootstrap the dashboard with an initial user, as per manual.
After that, point your browser to your node port 3000 and the dashboard
should come up and let you login with the user you created during the
bootstrap.
- For production, use the provided `install_gateway` and `install_dashboard`
recipes. You will want to change the configuration attributes. Best solution
is to create your own wrapper cookbook, where you set the `default` attributes.

Tyk MDCB (sink) attribute descriptions:

Filesystem tuning:
default['tyk']['sink']['open_file_limit_nofile'] = 65536
default['tyk']['sink']['open_file_limit_nproc'] = 65536

Listen port for service:
default['tyk']['sink']['config']['listen_port'] = 9090

Package location and version:
default['tyk']['sink']['package_version'] = '1.0.0.2'
default['tyk']['sink']['package_source'] = 'http://artifactory.gannettdigital.com/artifactory/binaries/tyk/tyk-sink/' \
  "tyk-mdcb-linux-amd64-#{node['tyk']['sink']['package_version']}.tar.gz"
default['tyk']['sink']['package_path'] = '/opt/tyk-sink'
default['tyk']['sink']['package_extracted_path'] = "tyk-mdcb.linux.amd64-#{node['tyk']['sink']['package_version']}"

Redis backend connection details:
default['tyk']['sink']['config']['storage']['type'] = 'redis'
default['tyk']['sink']['config']['storage']['host'] = 'localhost'
default['tyk']['sink']['config']['storage']['port'] = 6379

Enable or disable hashing of keys:
default['tyk']['sink']['config']['hash_keys'] = true

Mongo backend connection details:
default['tyk']['sink']['config']['analytics']['mongo_url'] = 'mongodb://127.0.0.1:27017/tyk_analytics'

License key:
default['tyk']['sink']['config']['license'] = ''


## Contributing

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

## License and Author

  * Author: Michal Taborsky <michal@taborsky.cz>

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0`

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
