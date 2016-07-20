class WorkflowStateSerializer < ActiveModel::Serializer
  attributes :id, :state, :content
 # has_one :workflow
  has_many :workflow_events
end
