json.array!(@workflow_events) do |workflow_event|
  json.extract! workflow_event, :id, :workflow_state_id, :event
  json.url workflow_event_url(workflow_event, format: :json)
end
