# Thermostart - Cloudless Thermosmart
Make your (currently) useless Thermosmart device cloud independent and get
your old scheduling functionality back.

Created with Flask technology and fully dockerized.

## Flask commands

## Quick start: dockerize development
In the root folder, copy the `.env.example` file and name the new file `.env.dev`.
You may change the values as you need, especially it's a good practice to set
unique SECRET_KEY - at least change some characters there :)

After that stay in the root folder and use following commands:
```
# give permissions to your entrypoint_debug.sh file
chmod +x services/web/entrypoint_debug.sh

# build and run
docker-compose build -f Dockerfile.debug
docker-compose up -d -f Dockerfile.debug

# delete if not needed anymore
docker-compose down -f Dockerfile.debug
```
To use the application visit http://localhost:3888 in your browser.

#### Additional useful commands
```
# RUN in DEBUG mode
python manage.py --app thermostart run --debug

# Open shell with app's data
flask --app thermostart shell
```

## Docker compose related commands

```
# Docker running operations
docker-compose build
docker-compose build --no-cache
docker-compose up -d      # d makes in run in the background
docker-compose down       # remove existing container        | CAREFUL IN PRODUCTION!
docker-compose down -v    # include volume of sqlite data    | CAREFUL IN PRODUCTION!

# Docker check logs
docker-compose logs

# Stop containers
docker-compose stop
docker stop thermostart-web-1

# Start containers
docker-compose start
docker start thermostart-web-1
```

## Production
Basically it's the same way as dev server, but you need to use different files:
- create .env.prod for environment variables:
  - `APP_FOLDER=/home/app/web`
  - `DATABASE_URL= <URL with proper database data>`

You might want to copy the database which you created in the debug container. In that case make
sure you change the ownership to userid:groupid 101:101 after copying the database file to the
volume of the production container.

And most importantly, to every docker command add the "-f" flag: `-f docker-compose.prod.yml`
to point to the file that you want to use to build images and run. Example:
```
# build and run
docker-compose -f docker-compose.prod.yml build
docker-compose -f docker-compose.prod.yml up -d
$
```
## API to Thermostart server
The API documentation can be found [docs/api/api.md](/docs/api/api.md). 
At the moment it supports some basic setttings only.

## Support the initiator (wichers' work)
This repository is a clone of wichers' repository. 
He did some excellent work on making sure that these devices can still be used. Thank him by buying him a coffee!

[!["Buy Wichers A Coffee"](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://www.buymeacoffee.com/wichers)
