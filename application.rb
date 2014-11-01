require 'sinatra'
require 'data_mapper'
require './models/Task'

# Database connection
DataMapper::setup(:default,"sqlite3://#{Dir.pwd}/database.db")

DataMapper.auto_upgrade!

get '/' do
  # @tasks = Task.all :order => :status.desc
  @todos = Task.find_all {|task| task.status == "todo"}
  @inprogresses = Task.all.find_all {|task| task.status == "inprogress"}
  @doneds = Task.all.find_all {|task| task.status == "done"}
  erb :index
end

get '/:id' do
  @task = Task.get params[:id]
  erb :task
end

put '/:id' do
  task = Task.get params[:id]
  task.status = params[:status]
  task.status_desc = params[:status_desc]
  task.updated_at = Time.now
  task.save
  redirect '/'
end

post '/' do
  task = Task.new
  task.title = params[:title]
  task.status = params[:status]
  task.desc = params[:desc]
  task.username = params[:username]
  task.created_at = Time.now
  task.updated_at = Time.now
  task.save
  redirect '/'
end

get '/:id/delete' do
  @task = Task.get params[:id]
  erb :delete
end

delete '/:id' do
  task = Task.get params[:id]
  task.destroy
  redirect '/'
end

get "/kaljaa" do
  "oispa kaljaa"
end
