json.array!(@user_workflow_statuses) do |user_workflow_status|
  json.extract! user_workflow_status, :id, :user_id, :workflow_id, :workflow_status
  json.url user_workflow_status_url(user_workflow_status, format: :json)
end
