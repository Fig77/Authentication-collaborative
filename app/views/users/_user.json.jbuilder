json.extract! user, :id, :name, :email, :pwd, :created_at, :updated_at
json.url user_url(user, format: :json)
