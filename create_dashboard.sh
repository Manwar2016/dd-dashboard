#!/bin/sh
# include parse_yaml function
. ./parse_yaml.sh
# read yaml file
eval $(parse_yaml dd-dashboard.yml "config_")

#Assign YAML Variable to class variable
api_key=$config_datadog_api_key
app_key=$config_datadog_app_key
boardtitle=$config_boardtitle
originaltitle=$config_originaltitle
mainheader=$config_mainheader
dd_agent_hostname=$config_dd_agent_hostname
cf_deployment=$config_cf_deployment
rabbit_deployment=$config_rabbit_deployment
redis_deployment=$config_redis_deployment
mysql_deployment=$config_mysql_deployment
dc0ip=$config_diego_0
dc1ip=$config_diego_1
dc2ip=$config_diego_2
dc3ip=$config_diego_3
dc4ip=$config_diego_4
dc5ip=$config_diego_5
dc6ip=$config_diego_6
dc7ip=$config_diego_7
dc8ip=$config_diego_8
router0ip=$config_router_0
router1ip=$config_router_1
router2ip=$config_router_2
router3ip=$config_router_3
router4ip=$config_router_4
router5ip=$config_router_5
router6ip=$config_router_6
router7ip=$config_router_7
router8ip=$config_router_8
uaa0ip=$config_uaa_0
uaa1ip=$config_uaa_1
uaa2ip=$config_uaa_2
cc0ip=$config_cc_0
cc1ip=$config_cc_1
cc2ip=$config_cc_2
nats0ip=$config_nats_0
nats1ip=$config_nats_1
nats2ip=$config_nats_2
etcd0ip=$config_etcd_0
etcd1ip=$config_etcd_1
etcd2ip=$config_etcd_2
doppler0ip=$config_doppler_0
doppler1ip=$config_doppler_1
doppler2ip=$config_doppler_2
db0ip=$config_diegobrain_0
db1ip=$config_diegobrain_1
db2ip=$config_diegobrain_2
rabbitserver0ip=$config_rabbitserver_0
rabbitserver1ip=$config_rabbitserver_1
rabbitproxy0ip=$config_rabbitproxy_0
rabbitproxy1ip=$config_rabbitproxy_1
rabbitbroker0ip=$config_rabbitbroker_0
rabbitbroker1ip=$config_rabbitbroker_1
redisbroker0ip=$config_redisbroker_0
redisbroker1ip=$config_redisbroker_1
redisdedicatednode0ip=$config_redisdedicatednode_0
redisdedicatednode1ip=$config_redisdedicatednode_1
redisdedicatednode2ip=$config_redisdedicatednode_2
redisdedicatednode3ip=$config_redisdedicatednode_3
redisdedicatednode4ip=$config_redisdedicatednode_4
redisdedicatednode5ip=$config_redisdedicatednode_5
mysqlserver0ip=$config_mysqlserver_0
mysqlserver1ip=$config_mysqlserver_1
mysqlserver2ip=$config_mysqlserver_2
mysqlproxy0ip=$config_mysqlproxy_0
mysqlproxy1ip=$config_mysqlproxy_1
mysqlproxy2ip=$config_mysqlproxy_2
mysqlbroker0ip=$config_mysqlbroker_0
mysqlbroker1ip=$config_mysqlbroker_1
mysqlbroker2ip=$config_mysqlbroker_2

#Checking whether Datadog api_key and api_key are present or not
if [[ -z "$api_key" && -z "$app_key" ]]; then
  echo "Error: Datadog api_key and app_key are missing. Please add these variables inside dd-dashboard.yml file"
  exit 0
else
  echo "Info: Datadog api_key and app_key are present inside dd-dashboard.yml file."
fi

# Print the values
#echo "api_key : "  $api_key
#echo "app_key : "  $app_key
#echo "boardtitle : "  $boardtitle
#echo "originaltitle : "  $originaltitle
#echo "mainheader : "  $mainheader
#echo "dd_agent_hostname : "  $dd_agent_hostname
#echo "cf_deployment : "  $cf_deployment
#echo "rabbit_deployment : "  $rabbit_deployment
#echo "redis_deployment : "  $redis_deployment
#echo "mysql_deployment : "  $mysql_deployment
#echo "dc0ip : "  $dc0ip
#echo "dc1ip : "  $dc1ip
#echo "dc2ip : "  $dc2ip
#echo "dc3ip : "  $dc3ip
#echo "dc4ip : "  $dc4ip
#echo "dc5ip : "  $dc5ip
#echo "dc6ip : "  $dc6ip
#echo "dc7ip : "  $dc7ip
#echo "dc8ip : "  $dc8ip
#echo "router0ip : "  $router0ip
#echo "router1ip : "  $router1ip
#echo "router2ip : "  $router2ip
#echo "router3ip : "  $router3ip
#echo "router4ip : "  $router4ip
#echo "router5ip : "  $router5ip
#echo "router6ip : "  $router6ip
#echo "router7ip : "  $router7ip
#echo "router8ip : "  $router8ip
#echo "uaa0ip : "  $uaa0ip
#echo "uaa1ip : "  $uaa1ip
#echo "uaa2ip : "  $uaa2ip
#echo "cc0ip : "  $cc0ip
#echo "cc1ip : "  $cc1ip
#echo "cc2ip : "  $cc2ip
#echo "nats0ip : "  $nats0ip
#echo "nats1ip : "  $nats1ip
#echo "nats2ip : "  $nats2ip
#echo "etcd0ip : "  $etcd0ip
#echo "etcd1ip : "  $etcd1ip
#echo "etcd2ip : "  $etcd2ip
#echo "doppler0ip : "  $doppler0ip
#echo "doppler1ip : "  $doppler1ip
#echo "doppler2ip : "  $doppler2ip
#echo "db0ip : "  $db0ip
#echo "db1ip : "  $db1ip
#echo "db2ip : "  $db2ip
#echo "rabbitserver0ip : "  $rabbitserver0ip
#echo "rabbitserver1ip : "  $rabbitserver1ip
#echo "rabbitproxy0ip : "  $rabbitproxy0ip
#echo "rabbitproxy1ip : "  $rabbitproxy1ip
#echo "rabbitbroker0ip : "  $rabbitbroker0ip
#echo "rabbitbroker1ip : "  $rabbitbroker1ip
#echo "redisbroker0ip : "  $redisbroker0ip
#echo "redisbroker1ip : "  $redisbroker1ip
#echo "redisdedicatednode0ip : "  $redisdedicatednode0ip
#echo "redisdedicatednode1ip : "  $redisdedicatednode1ip
#echo "redisdedicatednode2ip : "  $redisdedicatednode2ip
#echo "redisdedicatednode3ip : "  $redisdedicatednode3ip
#echo "redisdedicatednode4ip : "  $redisdedicatednode4ip
#echo "redisdedicatednode5ip : "  $redisdedicatednode5ip
#echo "mysqlserver0ip : "  $mysqlserver0ip
#echo "mysqlserver1ip : "  $mysqlserver1ip
#echo "mysqlserver2ip : "  $mysqlserver2ip
#echo "mysqlproxy0ip : "  $mysqlproxy0ip
#echo "mysqlproxy1ip : "  $mysqlproxy1ip
#echo "mysqlproxy2ip : "  $mysqlproxy2ip
#echo "mysqlbroker0ip : "  $mysqlbroker0ip
#echo "mysqlbroker1ip : "  $mysqlbroker1ip
#echo "mysqlbroker2ip : "  $mysqlbroker2ip


rm -rf ./input.json
cp -p dd.json input.json
# Replacing the demo values to the original values inside input.json
sed -i "s/boardtitle/$boardtitle/g" input.json
sed -i "s/originaltitle/$originaltitle/g" input.json
sed -i "s/mainheader/$mainheader/g" input.json
sed -i "s/cf_deployment/$cf_deployment/g" input.json
sed -i "s/dd_agent_hostname/$dd_agent_hostname/g" input.json
sed -i "s/rabbit_deployment/$rabbit_deployment/g" input.json
sed -i "s/redis_deployment/$redis_deployment/g" input.json
sed -i "s/mysql_deployment/$mysql_deployment/g" input.json
sed -i "s/dc0ip/$dc0ip/g" input.json
sed -i "s/dc1ip/$dc1ip/g" input.json
sed -i "s/dc2ip/$dc2ip/g" input.json
sed -i "s/dc3ip/$dc3ip/g" input.json
sed -i "s/dc4ip/$dc4ip/g" input.json
sed -i "s/dc5ip/$dc5ip/g" input.json
sed -i "s/dc6ip/$dc6ip/g" input.json
sed -i "s/dc7ip/$dc7ip/g" input.json
sed -i "s/dc8ip/$dc8ip/g" input.json
sed -i "s/router0ip/$router0ip/g" input.json
sed -i "s/router1ip/$router1ip/g" input.json
sed -i "s/router2ip/$router2ip/g" input.json
sed -i "s/router3ip/$router3ip/g" input.json
sed -i "s/router4ip/$router4ip/g" input.json
sed -i "s/router5ip/$router5ip/g" input.json
sed -i "s/router6ip/$router6ip/g" input.json
sed -i "s/router7ip/$router7ip/g" input.json
sed -i "s/router8ip/$router8ip/g" input.json
sed -i "s/uaa0ip/$uaa0ip/g" input.json
sed -i "s/uaa1ip/$uaa1ip/g" input.json
sed -i "s/uaa2ip/$uaa2ip/g" input.json
sed -i "s/cc0ip/$cc0ip/g" input.json
sed -i "s/cc1ip/$cc1ip/g" input.json
sed -i "s/cc2ip/$cc2ip/g" input.json
sed -i "s/nats0ip/$nats0ip/g" input.json
sed -i "s/nats1ip/$nats1ip/g" input.json
sed -i "s/nats2ip/$nats2ip/g" input.json
sed -i "s/etcd0ip/$etcd0ip/g" input.json
sed -i "s/etcd1ip/$etcd1ip/g" input.json
sed -i "s/etcd2ip/$etcd2ip/g" input.json
sed -i "s/doppler0ip/$doppler0ip/g" input.json
sed -i "s/doppler1ip/$doppler1ip/g" input.json
sed -i "s/doppler2ip/$doppler2ip/g" input.json
sed -i "s/db0ip/$db0ip/g" input.json
sed -i "s/db1ip/$db1ip/g" input.json
sed -i "s/db2ip/$db2ip/g" input.json
sed -i "s/rabbitserver0ip/$rabbitserver0ip/g" input.json
sed -i "s/rabbitserver1ip/$rabbitserver1ip/g" input.json
sed -i "s/rabbitproxy0ip/$rabbitproxy0ip/g" input.json
sed -i "s/rabbitproxy1ip/$rabbitproxy1ip/g" input.json
sed -i "s/rabbitbroker0ip/$rabbitbroker0ip/g" input.json
sed -i "s/rabbitbroker1ip/$rabbitbroker1ip/g" input.json
sed -i "s/redisbroker0ip/$redisbroker0ip/g" input.json
#sed -i "s/redisbroker1ip/$redisbroker1ip/g" input.json
sed -i "s/redisdedicatednode0ip/$redisdedicatednode0ip/g" input.json
sed -i "s/redisdedicatednode1ip/$redisdedicatednode1ip/g" input.json
sed -i "s/redisdedicatednode2ip/$redisdedicatednode2ip/g" input.json
sed -i "s/redisdedicatednode3ip/$redisdedicatednode3ip/g" input.json
sed -i "s/redisdedicatednode4ip/$redisdedicatednode4ip/g" input.json
sed -i "s/redisdedicatednode5ip/$redisdedicatednode5ip/g" input.json
sed -i "s/mysqlserver0ip/$mysqlserver0ip/g" input.json
sed -i "s/mysqlserver1ip/$mysqlserver1ip/g" input.json
sed -i "s/mysqlserver2ip/$mysqlserver2ip/g" input.json
sed -i "s/mysqlproxy0ip/$mysqlproxy0ip/g" input.json
sed -i "s/mysqlproxy1ip/$mysqlproxy1ip/g" input.json
sed -i "s/mysqlproxy2ip/$mysqlproxy2ip/g" input.json
sed -i "s/mysqlbroker0ip/$mysqlbroker0ip/g" input.json
sed -i "s/mysqlbroker1ip/$mysqlbroker1ip/g" input.json
sed -i "s/mysqlbroker2ip/$mysqlbroker2ip/g" input.json

echo "Info: Replacing the demo values of all the components to the original values (from dd-dashboard.yml) inside input.json file"
echo "Info: Checking whether the dashboard \"$boardtitle\" is present or not!!"

# Fetching the dashboard details
curl -s -X GET "https://app.datadoghq.com/api/v1/screen?api_key=${api_key}&application_key=${app_key}" | jq -r .screenboards[].title > ./screen_board_titles.txt
#See all the Dashboard titles
#cat screen_board_titles.txt
if grep -q $boardtitle screen_board_titles.txt; then
  echo "Error: Dashboard with title \"$boardtitle\" found. Please change the boardtitle inside dd-dashboard.yml and try again."
  # Removing helper files
  rm -rf ./screen_board_titles.txt
  exit 0
else
  echo "Info: Dashboard with title \"$boardtitle\" not found. Creating new Dashboard with Title \"$boardtitle\""
  # Removing helper files
  rm -rf ./screen_board_titles.txt
fi

create_dashboard_api_response=$(curl -s -X POST -H "Content-type: application/json" -d @input.json "https://app.datadoghq.com/api/v1/screen?api_key=${api_key}&application_key=${app_key}")

new_dashboard_id=$(echo $create_dashboard_api_response | jq -r .id)
echo "Info: New Dashboard ID: " $new_dashboard_id
