json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :password, :password_confirmation, :address, :phone, :cart_id
  json.url user_url(user, format: :json)
end
