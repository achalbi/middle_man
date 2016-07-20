json.array!(@workflow_states) do |workflow_state|
  json.extract! workflow_state, :id, :workflow_id, :state, :content
  json.url workflow_state_url(workflow_state, format: :json)
end
