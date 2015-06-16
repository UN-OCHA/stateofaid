ogr2ogr \
-f GeoJSON \
-where "ISO3_CNT1 IN ('AFG','BFA','CMR','CAF','TCD','COD','GMB','IRQ','MLI','MRT','MMR','NER','NGA','PSE','SEN','SOM','SSD','SDN','SYR','UKR','YEM','NGA','BDI','LBY','HND','GTM','DJI','NPL','VUT','ETH','KEN','UGA','RWA','TZA','COG','TUR','JOR','EGY','LBN')" \
boundary.json \
wrl_polbndl_int_15m_uncs.shp


ogr2ogr \
-f GeoJSON \
-where "ISO_3 IN ('AFG','BFA','CMR','CAF','TCD','COD','GMB','IRQ','MLI','MRT','MMR','NER','NGA','PSE','SEN','SOM','SSD','SDN','SYR','UKR','YEM','NGA','BDI','LBY','HND','GTM','DJI','NPL','VUT','ETH','KEN','UGA','RWA','TZA','COG','TUR','JOR','EGY','LBN')" \
nations.json \
wrl_polbnda_int_15m_uncs.shp

topojson -o nation-bndry.json --id-property ISO_3 --properties name=Terr_Name -- nations.json boundary.json

var sahelCountries = ['TCD', 'MLI', 'NER', 'CMR', 'MMR', 'NGA', 'BFA', 'SEN', 'GMB', 'SAHEL'];
var nigeria3RP = ['CMR', 'TCD', 'NER'];
var burundi3RP = ['RWA', 'TZA', 'COD'];
var southSudan3RP = ['ETH', 'KEN', 'SDN', 'UGA'];
var syria3RP = ['TUR', 'IRQ', 'JOR', 'EGY', 'LBN'];

* CAR 3RP *
Chad  TCD
Cameroon  CMR
DRC COD
Congo - COG

* Burundi 3RP *
Rwanda  RWA
Tanzania  TZA
DRC COD

* South Sudan 3RP *
Ethiopia  ETH
Kenya KEN
Sudan SDN
Uganda UGA

* Syria 3RP *
Turkey TUR
Iraq IRQ
Jordan JOR
Egypt EGY
Lebanon LBN

* SAHEL *
Chad  TCD
Mali  MLI
Niger NER
Cameroon  CMR
Mauritania  MMR
Nigeria NGA
Burkina Faso  BFA
Senegal SEN
Gambia  GMB
SAHEL - Sahel Regional

* Nigeria 3RP *
Cameroon  CMR
Chad  TCD
Niger NER
