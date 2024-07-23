#! /bin/bash

#start Terminal&SSH addon; execute:

cd /tmp
wget https://github.com/mk-maddin/ShellyForHASS/archive/refs/heads/migration.zip
unzip /tmp/migration.zip
cp -fr /tmp/ShellyForHASS-migration/custom_components/shellyforhass /config/custom_components/shellyforhass
rm -fr /config/custom_components/shelly
sed -i  's#^shelly:\s*$#shellyforhass:#g' /config/packages/shelly/shelly_integration.yaml
