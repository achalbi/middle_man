class UserWorkflowStatusSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :workflow_state
  has_one :workflow
end
