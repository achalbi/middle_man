class WorkflowEventSerializer < ActiveModel::Serializer
	include Rails.application.routes.url_helpers

  attributes :id, :event, :url
  has_one :workflow_state
  has_one :transition

  def url
  	"http://middle_man.dev:3000" +workflow_event_path(object)+"/transitions/"+object.transition.id.to_s+"/set_state"
  end
end
