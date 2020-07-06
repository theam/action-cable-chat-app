# action-cable-chat-app
A simple chat app to create benchmarks and compare it to Booster: https://agilemonkeys.atlassian.net/browse/BOOST-759

## Steps to run this project

1. `bundle install`
2. `yarn install`
3. `docker-compose up` (remember to start Docker if you're on MacOS)
4. `rails s` and go to localhost:3000

## Benchmarking Action Cable

1. Clone this repo: https://github.com/anycable/websocket-bench. You'll need `Go lang` installed.
2. `cd` to the repo root folder. `cd websocket-bench`
3. `go build .`
4. `go run .`. This is the `websocket-bench` software. I tried installing it by `go install .` but it doesn't seem to be working.
5. Please check out the parent's repository README to know how to use this tool: https://github.com/hashrocket/websocket-shootout/blob/master/README.md

Example: `go run . broadcast ws://127.0.0.1:3000/cable -c 4 -s 1000 --step-size 100 --origin http://127.0.0.1 --server-type actioncable`

## Benchmarking steps
1. Disable the **user authentication from connection.rb**. You should only leave `identified_by :id` and **not** `identified_by :current_user`
2. Add this to your environment config file `config.action_cable.disable_request_forgery_protection = true`
