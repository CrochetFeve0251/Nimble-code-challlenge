json.extract! person, :id, :firstname, :lastname, :login, :password, :citizen_id, :student_number, :created_at, :updated_at
json.url student_url(student, format: :json)
