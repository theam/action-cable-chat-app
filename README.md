# action-cable-chat-app
A simple chat app to create benchmarks and compare it to Booster: https://agilemonkeys.atlassian.net/browse/BOOST-759

## Steps to run this project

1. `bundle install`
2. `docker-compose up` (remember to start Docker if you're on MacOS)
3. `rails s` -> localhost:3000

## Benchmarking Action Cable

1. Clone this repo: https://github.com/anycable/websocket-bench. You'll need `Go lang` installed.
2. `cd` to the repo root folder. `cd websocket-bench`
3. `go build .`
4. `go run .`. This is the `websocket-bench` software. I tried installing it by `go install .` but it doesn't seem to be working.
5. Please check out the parent's repository README to know how to use this tool: https://github.com/hashrocket/websocket-shootout/blob/master/README.md