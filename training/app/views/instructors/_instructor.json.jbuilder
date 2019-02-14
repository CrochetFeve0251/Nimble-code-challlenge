json.extract! person, :id, :firstname, :lastname, :login, :password, :citizen_id, :created_at, :updated_at, :departement_name, :instructor_number
json.url instructor_url(person, format: :json)
