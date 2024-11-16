# docker-imposm
Imposm configuration wrapper

For now the project use OpenMapTiles schema: https://openmaptiles.org/schema/

The mapping.yaml comes from https://github.com/openmaptiles/openmaptiles:
- To generate a mapping.yaml: clone and run make command. Then copy/paste the mapping.yaml file from build folder created by make script. To check if the mapping file in our repo needs an update sometimes to times.
- OpenMapTiles use additional data with OSM, they are added in the database with the import-data image: https://github.com/openmaptiles/openmaptiles-tools/tree/d241d4434811159bc82bcd2a94f11db5bbba89ae/docker/import-data .
This image is called openmaptiles-import in our docker project. Check the repo sometimes to times to see if their is an update.

Steps to deploy:
- Build imposm image
    - Create imposm image with configuration files for Imposm + list of .pbf files
- Run imposm & postgis containers + volumes
    - Create a postgis db with hstore extension and run imposm container
- Import additional data for openmaptiles schema 
    - Add Natural Earth and stuff in postgis db
- Import OSM data with openmaptiles mapping file
    - Exec imposm import command by iterating on .pbf files
- Boumbap you have an OSM database

For now the 2 only manual steps are:
- Define the area of work through the clip.geojson
- Get .pbf urls and set it in the .env file


Next steps:
- Check OpenMapTiles styles for maps -> Is it following the postgis schema?
 -> Nope, need another solution. 
    -> Generate OMT MBTiles for basemap + specific OSM schema if needed or just a 2nd database for geographic data
    -> Does Martin can serve two sources in the same time? Can I use OMT styles with mbtiles served by Martin?
- Tegola: How to configure lists of sources/layers + Pregenerate tiles0 + dockerize
- Maputnik: How to open with a specific config file?
- Sprites: library for sprites generation
- Add osm update command + strategy to update tiles if pregenerated tiles are needed