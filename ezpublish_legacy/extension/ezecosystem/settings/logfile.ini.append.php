<?php /* #?ini charset="utf-8"?

# eZ Publish configuration file for parse apache log file

[AccessLogFileSettings]
# Storage of the log file, for example /var/log/httpd/
StorageDir=/var/log/apache2/
# The name of log file, for example mytest.log
LogFileName=ezecosystem_access.log
# If using site match by URL, the site may like http://siteurl/mysite and
# apache log will start with for example mysite/content/view/full/node_id. To
# remove this prefix in apache log before analysis the log, add mysite to 
# SitePrefix. Example: SitePrefix[]=mysite
SitePrefix[]=
# If any site accesses use the PathPrefix setting, enter them here
PathPrefix[]=

*/ ?>