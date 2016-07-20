class WorkflowEvent
  include Mongoid::Document
  include Mongoid::Timestamps

  has_one :transition

  field :event, type: String
  belongs_to :workflow_state
end
