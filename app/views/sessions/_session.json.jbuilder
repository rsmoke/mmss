json.extract! session, :id, :camp_configuration_id, :description, :begin_date, :end_date, :active, :created_at, :updated_at
json.url session_url(session, format: :json)
