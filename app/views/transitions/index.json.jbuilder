json.array!(@transitions) do |transition|
  json.extract! transition, :id, :workflow_state_id, :workflow_event_id
  json.url transition_url(transition, format: :json)
end
