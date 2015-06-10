ogr2ogr \
-f GeoJSON \
-where "ISO3_CNT1 IN ('AFG','BFA','CMR','CAF','TCD','COD','GMB','IRQ','MLI','MRT','MMR','NER','NGA','PSE','SEN','SOM','SSD','SDN','SYR','UKR','YEM','NGA','BDI','LBY','HND','GTM','DJI','NPL','VUT','ETH','KEN','UGA','RWA','TZA')" \
nations.json \
wrl_polbndl_int_15m_uncs.shp


ogr2ogr \
-f GeoJSON \
-where "ISO_3 IN ('AFG','BFA','CMR','CAF','TCD','COD','GMB','IRQ','MLI','MRT','MMR','NER','NGA','PSE','SEN','SOM','SSD','SDN','SYR','UKR','YEM','NGA','BDI','LBY','HND','GTM','DJI','NPL','VUT','ETH','KEN','UGA','RWA','TZA')" \
nations.json \
wrl_polbnda_int_15m_uncs.shp

topojson -o nation-bndry.json --id-property ISO_3 --properties name=Terr_Name -- nations.json boundary.json
