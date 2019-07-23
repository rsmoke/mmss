json.extract! activity, :id, :session_id, :description, :cost_in_cents, :date_occurs, :active, :created_at, :updated_at
json.url activity_url(activity, format: :json)
