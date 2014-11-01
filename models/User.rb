class User
  include Datamapper::Resourse
  property :id, Integer
  property :username, String
  property :password, String
  property :team_id, Integer
end