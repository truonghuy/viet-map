pushd ne_10m_populated_places
ogr2ogr \
-f GeoJSON \
-where "ISO_A2 = 'VN' AND SCALERANK < 8" \
places.json \
ne_10m_populated_places.shp
cp ne_10m_populated_places.shp ..
popd
pushd ne_10m_admin_0_map_subunits
ogr2ogr \
-f GeoJSON \
-where "ADM0_A3 IN ('VNM', 'LAO', 'KHM', 'CHN', 'THA')" \
subunits.json \
ne_10m_admin_0_map_subunits.shp
popd
topojson \
-o vietnam.json \
--id-property SU_A3 \
--properties name=NAME \
-- \
subunits.json \
places.json
