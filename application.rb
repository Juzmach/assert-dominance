require 'sinatra'
require 'data_mapper'
require './models/Task'

# Database connection
DataMapper::setup(:default,"sqlite3://#{Dir.pwd}/database.db")

DataMapper.auto_upgrade!

get '/' do
  @tasks = Task.all :order => :id.desc
  erb :index
end

get '/:id' do
  @task = Task.get params[:id]
  erb :edit
end

put '/:id' do
  task = Task.get params[:id]
  task.status = params[:status]
  task.updated_at = Time.now
  task.save
  redirect '/'
end

post '/' do
  task = Task.new
  task.title = params[:title]
  task.status = params[:status]
  task.created_at = Time.now
  task.updated_at = Time.now
  task.save
  redirect '/'
end

get "/kaljaa" do
  "oispa kaljaa"
end
