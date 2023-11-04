postgres:
	docker run --name postgresql -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=JoySarkar@456 -d postgres

createdb:
	docker exec -it postgresql createdb --username=root --owner=root simple_bank

dropdb:
	docker exec -it postgresql dropdb simple_bank

migrateup:
	migrate -path db/migration -database "postgresql://root:JoySarkar@456@localhost:5432/simple_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://root:JoySarkar@456@localhost:5432/simple_bank?sslmode=disable" -verbose down

sqlc:
	sqlc generate

.PHONY: createdb dropdb postgres migrateup migratedown sqlc
