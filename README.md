# Remote debugging ruby apps in Docker

#### Prerequisites

- [Docker](https://www.docker.com/products/docker#/mac)
- [Docker Compose](https://docs.docker.com/compose/)

#### Running the app

```bash
# start the app and database containers
docker compose up

# in another shell start the debugger
bundle exec byebug --remote <dockerhost>:3031

# add breakpoints in the code and trigger them with requests to <dockerhost>:3000
```
