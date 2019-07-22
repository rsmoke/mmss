json.extract! camp_configuration, :id, :camp_year, :application_open, :application_close, :priority, :application_materials_due, :camper_acceptance_due, :active, :created_at, :updated_at
json.url camp_configuration_url(camp_configuration, format: :json)
