build:
	docker build . -f Dockerfile.production -t dailystandup
run:
	docker run -p 4000:3000 --link=some-postgres:postgres --rm -ti dailystandup:latest
