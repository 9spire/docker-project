echo "I am running: $0"
docker-compose up -d website selenium
docker-compose run --rm unit-tests