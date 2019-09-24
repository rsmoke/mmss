json.extract! financial_aid, :id, :enrollment_id, :amount_cents, :source, :awarded, :note, :status, :created_at, :updated_at
json.url financial_aid_url(financial_aid, format: :json)
