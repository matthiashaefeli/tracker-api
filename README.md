# Tracker api

## This api is based on the complete react native and redux course on udemy

In the udemy course we create a express and mongoDB api.
For the app to work you need the express server and ngrok.

This rails api does the same function as the express api
just run rails s and that's it.

# Requirements

This code has been run and tested by Ruby 2.7.0 and Rails 6.0.3.2

# How to set up locally

```
$ git clone https://github.com/matthiashaefeli/tracker-api.git
$ bundle install
$ rails db:create
$ rails db:migrate
```

# Running the server

```
$ rails s
```

# Run test suit

not available, working on

# Changes in the tracks app

in tracker.js change baseURL to

```
baseURL: 'http://localhost:3000'
```
