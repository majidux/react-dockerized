b:
	docker compose -f docker-compose.yml up -d --build

save:
	docker save -o ../../docker-image/modern-instrumentations_front_$(shell date +%F_%H-%M-%S).tar modern-instrumentations-image

bomb:
	docker rm -f modern-instrumentations-container && docker rmi modern-instrumentations-image

run:
	docker run --name modern-instrumentations-container \
	-dt -p 4201:80/tcp -e NX_API_URL=bar --env-file ./.env.local \
	modern-instrumentations-image

kill:
	docker rm -f modern-instrumentations-container
	