build:
	docker build . --build-arg RAILS_MASTER_KEY=${DAILYSTANDUPENCKEY} -f Dockerfile.production -t dailystandup
run:
	docker run -p 4000:3000 -e RAILS_MASTER_KEY=${DAILYSTANDUPENCKEY} --rm -ti dailystandup:latest
bash:
	docker run -e RAILS_MASTER_KEY=${DAILYSTANDUPENCKEY} --rm -ti dailystandup:latest bash
prod_console:
	docker run -e RAILS_MASTER_KEY=${DAILYSTANDUPENCKEY} --rm -ti dailystandup:latest bundle exec rails c
create_db:
	docker run -e RAILS_MASTER_KEY=${DAILYSTANDUPENCKEY} --rm -ti dailystandup:latest bundle exec rake db:create
migrate_db:
	docker run -e RAILS_MASTER_KEY=${DAILYSTANDUPENCKEY} --rm -ti dailystandup:latest bundle exec rake db:migrate
push_image:
	docker tag dailystandup:latest ericroos13/dailystandup && docker tag dailystandup:latest ericroos13/dailystandup && docker push ericroos13/dailystandup
deploy:
	eb deploy dailystandup-prod-vpc
deploy_pipeline:
	make build push_image migrate_db
