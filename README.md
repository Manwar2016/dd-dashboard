# datadog_dashboard_automation
version: 1.9.7

#####Supported version:
######Ops Man version: v1.9.7.0
######ERT version: v1.9.13-build.3
######JMX version: v1.8.18

**Prerequisites**
```
$ yum install -y jq
```

**Steps for using this automation code.**

1. Update all the values inside dd-dashboard.yml. Datadog API KEY and APP KEY are must.
2. Don't change the dd-dashboard.yml schema. Just add the values.
3. Execute create_dashboard.sh script for creating a dashboard.
```
$ ./create_dashboard.sh
```

**Important Notes:**

1. The key 'originaltitle' inside **dd-dashboard.yml** is optional.
2. How to get the following data from ops manager.

  **a. cf_deployment:**
  
    You will get the cf_deployment name from `$ bosh deployments` command. For example, **cf-7ef78331cc72b3c09045**
    
  **b. rabbit_deployment:**
  
    You will get the rabbit_deployment name from `$ bosh deployments` command. For example, **p-rabbitmq-18aaf5daa37352015143**
    
  **c. redis_deployment:**
    
    You will get the redis_deployment name from `$ bosh deployments` command. For example, **p-redis-dd20e0646054e6ae58b5**
    
  **d. mysql_deployment:**
    
    You will get the mysql_deployment name from `$ bosh deployments` command. For example, **p-mysql-2da5ad350dff8216f310**

**Future RoadMap:**

1. Add the pcf-stoplights dashboard.

Thank you for using this automation script.


