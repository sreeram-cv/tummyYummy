json.array!(@agents) do |agent|
  json.extract! agent, :id, :name, :email, :password, :address, :phone, :items
  json.url agent_url(agent, format: :json)
end
