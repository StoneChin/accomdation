mysql:
	docker run --name test-mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=abc123321 -d mysql:5.7

createdb:
	docker exec -it test-mysql mysql -uroot -pabc123321 -e "create database accomdation charset=utf8"

dropdb:
	docker exec -it test-mysql mysql -uroot -pabc123321 -e "drop database accomdation"

migrateup:
	migrate -path db/migration -database "mysql://root:abc123321@tcp(localhost:3306)/accomdation" -verbose up

migratedown:
	migrate -path db/migration -database "mysql://root:abc123321@tcp(localhost:3306)/accomdation" -verbose down

sqlc:
	sqlc generate

.PHONY: mysql createdb dropdb migrateup migratedown sqlc