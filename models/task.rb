class Task
  include DataMapper::Resource
  property :id, Serial
  property :created_at, DateTime
  property :updated_at, DateTime
  property :title, String, required: true
  property :desc, Text, required: true
  property :username, String, required: true
  property :status, String, required: true
  property :status_desc, Text
  property :priority, Integer
end