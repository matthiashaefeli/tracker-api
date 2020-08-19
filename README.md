# Tracker API

## This API is based on the complete react native and redux course on udemy

In the udemy course we create a express and mongoDB api.
For the app to work you need a express server, ngrok, and a mongoDB account.

This rails api does the same function all in one,
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

# Sign up user

## Postman

POST:localhost:3000/signup

Headers: 

KEY: Content_type VALUE: application/json

Body: raw

```
{
    "email": "test@test.com",
    "password": "mypassword"
}
```

# Sign in User

## Postman

POST:localhost:3000/signin

Headers: 

KEY: Content_type VALUE: application/json

Body: raw

```
{
    "email": "test@test.com",
    "password": "mypassword"
}
```

# Create Track

## Postman

POST:localhost:3000/tracks

Headers: 

KEY: Authorization VALUE: Bearer token
         
KEY: Content_type VALUE: application/json
         
Body: raw

```
{
    "name": "my track",
    "locations": [
        {
            "timestamp": 10000000,
            "coords": {
                "latitude": 100,
                "longitude": 100,
                "altitude": 100,
                "accuracy": 100,
                "heading": 100,
                "speed": 100,
                "altitudeAccuracy": 200
            }
        }
    ]
}
```

# Tracks

## Postman

GET:localhost:3000/tracks

Headers: KEY: Authorization VALUE: Bearer token

