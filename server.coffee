hbs = require 'hbs'
express = require 'express'
stylus = require 'stylus'
oauth = require 'oauth'
req = require 'request'

app = express()

app.set 'view engine', 'hbs'
app.engine '.html', hbs.__express
app.set 'views', __dirname + '/views'
hbs.registerPartials __dirname + 'views/partials'

app.use stylus.middleware __dirname + '/assets'

baseurl = 'http://www.strava.com/api/v3'
#access_token =
#prive_

#routes
app.get '/', (request, response) ->
        context =
            title: 'Hello World'
            body: 'Hello World'
        response.render 'index', context

app.get '/athlete', (request, response) ->
    options =
               url: baseurl + '/athletes/2396440',
               qs: {access_token: 'ac0bd2c2b020c232ebe2c5603b4c5ccb2c5ffa49'}

    req options, (error, res, body) ->
        if !error and res.statusCode == 200
              info = JSON.parse body
              #console.log(info)
              response.render 'athlete', info

app.listen process.env.PORT || 3333

#curl -XGET https://www.strava.com/api/v3/athletes/2396440 -d access_token=ac0bd2c2b020c232ebe2c5603b4c5ccb2c5ffa49
