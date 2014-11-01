require 'sinatra'
require 'models/Task'

# Database connection
DataMapper::setup(:default,"sqlite3://#{Dir.pwd}/database.db")

get '/' do
  erb :index
end

get "/kaljaa" do
  "oispa kaljaa"
end