class UserWorkflowStatus
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user
  belongs_to :workflow_state
  belongs_to :workflow
end
