json.extract! person, :id, :firstname, :lastname, :login, :password, :citizen_id, :created_at, :updated_at
json.url person_url(person, format: :json)
