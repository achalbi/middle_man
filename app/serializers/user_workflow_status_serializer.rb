class UserWorkflowStatusSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :workflow_status
  has_one :workflow
end
