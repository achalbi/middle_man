class WorkflowStateSerializer < ActiveModel::Serializer
  attributes :id, :state
 # has_one :workflow
  has_many :workflow_events
end
