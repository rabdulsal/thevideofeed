require 'sinatra'

get '/' do
  erb :index
end

get '/about' do
  erb :about
end

get '/how_to' do
  erb :how_to
end