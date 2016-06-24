# Gateway
default['tyk']['gateway']['install_path'] = '/opt/tyk-gateway'
default['tyk']['gateway']['dashboard']['url'] = 'http://localhost'
default['tyk']['gateway']['dashboard']['port'] = '3000'
default['tyk']['gateway']['packagecloud_source'] = 'tyk/tyk-gateway'

# Gateway configuration
# The configuration file is generated from node['tyk']['gateway']['config']
# For documentation see https://tyk.io/v1.9/configuration/configuration/
default['tyk']['gateway']['config']['listen_port'] = 8080
default['tyk']['gateway']['config']['node_secret'] = 'Y0uSh0u1dR3a11yChang3Th1sS3cr3t'
default['tyk']['gateway']['config']['secret'] = 'Y0uSh0u1dR3a11yChang3Th1sS3cr3t'
default['tyk']['gateway']['config']['template_path'] = "#{node['tyk']['gateway']['install_path']}/templates"
default['tyk']['gateway']['config']['tyk_js_path'] = "#{node['tyk']['gateway']['install_path']}/js/tyk.js"
default['tyk']['gateway']['config']['use_db_app_configs'] = true
default['tyk']['gateway']['config']['db_app_conf_options']['connection_string'] = "#{node['tyk']['gateway']['dashboard']['url']}:#{node['tyk']['gateway']['dashboard']['port']}"
default['tyk']['gateway']['config']['db_app_conf_options']['node_is_segmented'] = false
default['tyk']['gateway']['config']['db_app_conf_options']['tags'] = []
default['tyk']['gateway']['config']['app_path'] = "#{node['tyk']['gateway']['install_path']}/apps"
default['tyk']['gateway']['config']['middleware_path'] = "#{node['tyk']['gateway']['install_path']}/middleware"
default['tyk']['gateway']['config']['storage']
default['tyk']['gateway']['config']['storage']['type'] = 'redis'
default['tyk']['gateway']['config']['storage']['host'] = 'localhost'
default['tyk']['gateway']['config']['storage']['port'] = 6379
default['tyk']['gateway']['config']['storage']['username'] = ''
default['tyk']['gateway']['config']['storage']['password'] = ''
default['tyk']['gateway']['config']['storage']['database'] = 0
default['tyk']['gateway']['config']['storage']['optimisation_max_idle'] = 500
default['tyk']['gateway']['config']['storage']['optimisation_max_active'] = 800
default['tyk']['gateway']['config']['enable_analytics'] = true
default['tyk']['gateway']['config']['analytics_config']['type'] = 'mongo'
default['tyk']['gateway']['config']['analytics_config']['csv_dir'] = '/tmp'
default['tyk']['gateway']['config']['analytics_config']['mongo_url'] = 'mongodb://127.0.0.1:27017/tyk_analytics'
default['tyk']['gateway']['config']['analytics_config']['mongo_collection'] = 'tyk_analytics'
default['tyk']['gateway']['config']['analytics_config']['purge_delay'] = 100
default['tyk']['gateway']['config']['analytics_config']['ignored_ips'] = []
default['tyk']['gateway']['config']['analytics_config']['enable_detailed_recording'] = true
default['tyk']['gateway']['config']['analytics_config']['enable_geo_ip'] = false
default['tyk']['gateway']['config']['analytics_config']['geo_ip_db_path'] = ''
default['tyk']['gateway']['config']['health_check']['enable_health_checks'] = true
default['tyk']['gateway']['config']['health_check']['health_check_value_timeouts'] = 60
default['tyk']['gateway']['config']['optimisations_use_async_session_write'] = true
default['tyk']['gateway']['config']['allow_master_keys'] = false
default['tyk']['gateway']['config']['policies']['policy_source'] = 'service'
default['tyk']['gateway']['config']['policies']['policy_connection_string'] = "#{node['tyk']['gateway']['dashboard']['url']}:#{node['tyk']['gateway']['dashboard']['port']}"
default['tyk']['gateway']['config']['policies']['policy_record_name'] = 'tyk_policies'
default['tyk']['gateway']['config']['hash_keys'] = true
default['tyk']['gateway']['config']['suppress_redis_signal_reload'] = false
default['tyk']['gateway']['config']['close_connections'] = true
default['tyk']['gateway']['config']['local_session_cache']['disable_cached_session_state'] = true

# Dashboard
default['tyk']['dashboard']['install_path'] = '/opt/tyk-dashboard'
default['tyk']['dashboard']['packagecloud_source'] = 'tyk/tyk-dashboard'

# Dashboard configuration
# The configuration file is generated from node['tyk']['dashboard']['config']
# For documentation see https://tyk.io/v1.9/configuration/dashboard-config/
default['tyk']['dashboard']['config']['listen_port'] = 3000
default['tyk']['dashboard']['config']['tyk_api_config']['Host'] = 'http://localhost'
default['tyk']['dashboard']['config']['tyk_api_config']['Port'] = node['tyk']['gateway']['config']['listen_port'].to_s
default['tyk']['dashboard']['config']['tyk_api_config']['Secret'] = node['tyk']['gateway']['config']['secret']
default['tyk']['dashboard']['config']['mongo_url'] = node['tyk']['gateway']['config']['analytics_config']['mongo_url']
default['tyk']['dashboard']['config']['page_size'] = 10
default['tyk']['dashboard']['config']['admin_secret'] = '12345'
default['tyk']['dashboard']['config']['shared_node_secret'] = 'Y0uSh0u1dR3a11yChang3Th1sS3cr3t'
default['tyk']['dashboard']['config']['redis_port'] = 6379
default['tyk']['dashboard']['config']['redis_host'] = 'localhost'
default['tyk']['dashboard']['config']['redis_password'] = ''
default['tyk']['dashboard']['config']['enable_cluster'] = false
default['tyk']['dashboard']['config']['license_key'] = 'provideavalidkeyhere'
default['tyk']['dashboard']['config']['redis_database'] = 0
default['tyk']['dashboard']['config']['redis_hosts'] = nil
default['tyk']['dashboard']['config']['force_api_defaults'] = false
default['tyk']['dashboard']['config']['notify_on_change'] = true
default['tyk']['dashboard']['config']['license_owner'] = 'Your Name'
default['tyk']['dashboard']['config']['hash_keys'] = true
default['tyk']['dashboard']['config']['email_backend']['enable_email_notifications'] = false
default['tyk']['dashboard']['config']['email_backend']['code'] = ''
default['tyk']['dashboard']['config']['email_backend']['settings'] = nil
default['tyk']['dashboard']['config']['email_backend']['default_from_email'] = ''
default['tyk']['dashboard']['config']['email_backend']['default_from_name'] = ''
default['tyk']['dashboard']['config']['hide_listen_path'] = false
default['tyk']['dashboard']['config']['use_sentry'] = false
default['tyk']['dashboard']['config']['sentry_code'] = ''
default['tyk']['dashboard']['config']['sentry_js_code'] = ''
default['tyk']['dashboard']['config']['show_org_id'] = true
default['tyk']['dashboard']['config']['enable_duplicate_slugs'] = true
default['tyk']['dashboard']['config']['enable_master_keys'] = false
default['tyk']['dashboard']['config']['host_config']['override_hostname'] = node['fqdn']
default['tyk']['dashboard']['config']['host_config']['disable_org_slug_prefix'] = true
default['tyk']['dashboard']['config']['host_config']['enable_host_names'] = false
default['tyk']['dashboard']['config']['host_config']['hostname'] = node['fqdn']
default['tyk']['dashboard']['config']['host_config']['portal_domains'] = {}
default['tyk']['dashboard']['config']['host_config']['portal_root_path'] = '/portal'
default['tyk']['dashboard']['config']['http_server_options']['use_ssl'] = false
default['tyk']['dashboard']['config']['http_server_options']['certificates'] = [{}]
default['tyk']['dashboard']['config']['ui']['login_page'] = {}
default['tyk']['dashboard']['config']['ui']['nav'] = {}
default['tyk']['dashboard']['config']['ui']['uptime'] = {}
default['tyk']['dashboard']['config']['ui']['portal'] = {}
default['tyk']['dashboard']['config']['ui']['designer'] = {}
default['tyk']['dashboard']['config']['ui']['languages']['English'] = 'en'
default['tyk']['dashboard']['config']['ui']['languages']['Chinese'] = 'cn'
default['tyk']['dashboard']['config']['ui']['languages']['Korean'] = 'ko'
default['tyk']['dashboard']['config']['ui']['default_lang'] = 'en'

default['tyk']['dashboard']['config']['home_dir'] = node['tyk']['dashboard']['install_path']

# Pump
default['tyk']['pump']['install_path'] = '/opt/tyk-pump'
default['tyk']['pump']['packagecloud_source'] = 'tyk/tyk-pump'

# Pump configuration
# The configuration file is generated from node['tyk']['pump']['config']
# For documentation see https://tyk.io/v1.9/configuration/configuration/
default['tyk']['pump']['config']['analytics_storage_type'] = 'redis'
default['tyk']['pump']['config']['analytics_storage_config']['type'] = 'redis'
default['tyk']['pump']['config']['analytics_storage_config']['host'] = 'localhost'
default['tyk']['pump']['config']['analytics_storage_config']['port'] = 6379
default['tyk']['pump']['config']['analytics_storage_config']['hosts'] = nil
default['tyk']['pump']['config']['analytics_storage_config']['username'] = ''
default['tyk']['pump']['config']['analytics_storage_config']['password'] = ''
default['tyk']['pump']['config']['analytics_storage_config']['database'] = 0
default['tyk']['pump']['config']['analytics_storage_config']['optimisation_max_idle'] = 100
default['tyk']['pump']['config']['analytics_storage_config']['optimisation_max_active'] = 0
default['tyk']['pump']['config']['analytics_storage_config']['enable_cluster'] = false
default['tyk']['pump']['config']['purge_delay'] = 10
default['tyk']['pump']['config']['pumps']['mongo']['name'] = 'mongo'
default['tyk']['pump']['config']['pumps']['mongo']['meta']['collection_name'] = 'tyk_analytics'
default['tyk']['pump']['config']['pumps']['mongo']['meta']['mongo_url'] = 'mongodb://127.0.0.1:27017/tyk_analytics'
default['tyk']['pump']['config']['uptime_pump_config']['collection_name'] = 'tyk_analytics'
default['tyk']['pump']['config']['uptime_pump_config']['mongo_url'] = 'mongodb://127.0.0.1:27017/tyk_analytics'
default['tyk']['pump']['config']['dont_purge_uptime_data'] = false
