```sh
d run -d --rm --name pg -e POSTGRES_PASSWORD=postgres postgres:18.1-trixie -d postgres
```

```sh
d exec -it pg psql -U postgres -d postgres -c "$(cat ./path/to/query.sql)"
```
