json.extract! session, :id, :camp_configuration_id, :description, :begin_date, :end_date, :active, :created_at, :updated_at
json.url camp_occurrence_url(camp_occurrence, format: :json)
