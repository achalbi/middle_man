class Workflow
  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :workflow_states
  has_one :user_workflow_status
  

  field :name, type: String
  field :description, type: String
end
