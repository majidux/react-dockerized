b:
	docker compose -f docker-compose.yml up -d --build

save:
	docker save -o ./project_$(shell date +%F_%H-%M-%S).tar project-image

bomb:
	docker rm -f project-container && docker rmi project-image

run:
	docker run --name project-container \
	-dt -p 4201:80/tcp -e NX_API_URL=bar --env-file ./.env.local \
	project-image

kill:
	docker rm -f project-container
	
