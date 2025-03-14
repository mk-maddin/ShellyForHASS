#! /bin/bash

#create a full backup of your home assistant
#start Terminal&SSH addon; execute:

cd /tmp
wget https://github.com/mk-maddin/ShellyForHASS/archive/refs/heads/migration.zip
unzip /tmp/migration.zip
cp -fr /tmp/ShellyForHASS-migration/custom_components/shellyforhass /config/custom_components/shellyforhass
rm -fr /config/custom_components/shelly
sed -i 's#^shelly:\s*$#shellyforhass:#g' /config/packages/shelly/shelly_integration.yaml
sed -i 's#shelly"#shellyforhass"#g' /config/.storage/core.config_entries
sed -i 's#identifiers":\[\[\([A-Za-z0-9_",-]*\)\(shelly"\)#identifiers":[[\1shellyforhass"#g' /config/.storage/core.device_registry
sed -i 's#platform":"shelly"#platform":"shellyforhass"#g' /config/.storage/core.entity_registry
mv -f /config/.storage/shelly /config/.storage/shellyforhass
