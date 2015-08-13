json.array!(@tasks) do |task|
  json.extract! task, :id, :execute_at, :code, :aasm_state, :node_id
  json.url task_url(task, format: :json)
end
