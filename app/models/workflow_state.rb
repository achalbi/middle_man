class WorkflowState
  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :workflow_events
  has_one :user_workflow_status
  

  field :state, type: String
  field :content, type: String

  belongs_to :workflow
end
