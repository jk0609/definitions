require('sinatra')
require('sinatra/reloader')
require('./lib/definitions')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @words = Words.all
  erb(:index)
end

post('/') do
  #create and add new word based on form param
  @words = Words.all
  erb(:index)
end
