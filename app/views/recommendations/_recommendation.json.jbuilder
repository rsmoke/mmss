json.extract! recommendation, :id, :enrollment_id, :email, :lastname, :firstname, :organization, :address1, :address2, :city, :state, :state_non_us, :postalcode, :country, :phone_number, :best_contact_time, :submitted_recommendation, :date_submitted, :created_at, :updated_at
json.url recommendation_url(recommendation, format: :json)
