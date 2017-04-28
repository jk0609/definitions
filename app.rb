require('sinatra')
require('sinatra/reloader')
require('./lib/definitions')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @words = Word.all
  erb(:index)
end

post('/') do
  new_word = Word.new({
    :name => params[:word],
    :img => params[:img]
    })
  new_def = Definition.new({
    :text => params[:def]
    })
  new_word.add_def(new_def)
  @words = Word.all
  erb(:index)
end

get('/new_word') do
  erb(:new_word)
end

get('/clear') do
  Word.clear
  erb(:clear)
end

get('/:id') do
  @one_word = Word.find(params[:id].to_i)
  erb(:one_word)
end

post('/:id') do
  @one_word = Word.find(params[:id].to_i)
  new_def = Definition.new({
    :text => params[:def]
    })
  @one_word.add_def(new_def)
  erb(:one_word)
end

get('/:id/new_def') do
  @one_word = Word.find(params[:id].to_i)
  erb(:new_def)
end
