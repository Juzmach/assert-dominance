class Task
  include DataMapper::Resource
  property :id, Serial
  property :created_at, DateTime
  property :updated_at, DateTime
  property :status, String
  property :status_desc, Text
  property :priority, Integer
end