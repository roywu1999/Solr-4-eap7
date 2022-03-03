# Solr4.0.0 porting on Enterprise Application Platform 7.4
This project try to deploy Solr-4.0.0 on JBOSS EAP 7.4 (WildFly Core 15.0.6.Final-redhat)
JDK RTE:

openjdk 11.0.13 2021-10-19
OpenJDK Runtime Environment (build 11.0.13+8-Ubuntu-0ubuntu1.20.04)
OpenJDK 64-Bit Server VM (build 11.0.13+8-Ubuntu-0ubuntu1.20.04, mixed mode, sharing)
Ref:
JBOSS EAP7.4: RedHat JBoss EAP
https://access.redhat.com/jbossnetwork/restricted/listSoftware.html?product=appplatform&downloadType=distributions 
Latest - EAP 7.4
Barebone Solr-4.0.0 zip file:
https://archive.apache.org/dist/lucene/solr/4.0.0/apache-solr-4.0.0.zip 

Step 1: Download EAP 7.4 Check the following link:
RedHat JBoss EAP
https://access.redhat.com/jbossnetwork/restricted/listSoftware.html?product=appplatform&downloadType=distributions 
Latest - EAP 7.4

Step 2: Download barebone Solr-4.0.0 zip file:

https://archive.apache.org/dist/lucene/solr/4.0.0/apache-solr-4.0.0.zip 
unzip apache-solr-4.0.0.zip .

Step 3: startup standalone EAP7.4 (add-user.sh before you create a new "admin" user)
~/jboss-home/bin/add-user.sh
after you add a new user, you can startup jboss app:
~/jboss-home/bin/standalone.sh

you can open the console: you can access by using the user you create on step3
http://127.0.0.1:9990/console/ 

Step 4: deploy the solr*.war file by using the console on step 3
before you deploy the war file, please copy the apache-solr-4.0.0 example solr directory to your classpath.
Which would be by default: <jboss-home>/bin/ when you start up jboss eap7.4

Step 5: after deploy successfully you can access solr console
http://127.0.0.1:8080/apache-solr-4.0.0/#/ 
ONLY warning I found so far is the following info:
13:18:02,455 WARN [org.apache.solr.handler.admin.SystemInfoHandler] (default task-3) Error getting JMX properties: java.lang.UnsupportedOperationException: Boot class path mechanism is not supported  

