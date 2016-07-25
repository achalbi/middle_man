class WorkflowSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :initial_state_url
  has_many :workflow_states

  def initial_state_url
  	# workflow_workflow_state_path(object, object.workflow_states[0]);
  	"https://middle-men.herokuapp.com/workflows/"+object.id+"/workflow_states/"+object.workflow_states[0].id
  end
end
