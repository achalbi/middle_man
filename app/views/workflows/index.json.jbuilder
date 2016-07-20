json.array!(@workflows) do |workflow|
  json.extract! workflow, :id, :name, :description
  json.url workflow_url(workflow, format: :json)
end
