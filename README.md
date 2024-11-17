
# docker-imposm

PostGIS + Imposm + Martin + OpenMapTiles MBTiles inside containers

2 possibilities:
- Create postgis data with custom imposm config + clip file + list of pbf in .env
	- make init-osm-db
- Create Mbtiles with OpenMapTiles schema (command to create in the makefile)

  
Next steps
-

Add OpenMatiles as a free Basemap

- Generate a mbtiles from OpenMapTiles repo: ok

- Serve this mbtiles with Martin and edit style with Maputnik: on going
docker run -it --rm -p 8888:80 ghcr.io/maplibre/maputnik:main

- En cours: Configuration de Martin pour servir les données MbTiles et postgis

- To see: Merge OpenMapTiles styles with local style + same for sprites

