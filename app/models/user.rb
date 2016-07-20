class User
  include Mongoid::Document

  field :name, type: String
  field :gender, type: String

  has_one :user_workflow_status
  
end
