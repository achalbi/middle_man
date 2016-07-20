class TransitionSerializer < ActiveModel::Serializer
  attributes :id, :transition_to

  def transition_to
  	WorkflowStateSerializer.new(object.workflow_state).attributes
  end

  has_one :workflow_state
  has_one :workflow_event
end
