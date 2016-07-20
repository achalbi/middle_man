class WorkflowSerializer < ActiveModel::Serializer
  attributes :id, :name, :description
  has_many :workflow_states
end
