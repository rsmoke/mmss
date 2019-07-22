FactoryBot.define do
  factory :camp_configuration do
    camp_year { 2019 }
    application_open { "2019-07-17" }
    application_close { "2019-07-17" }
    priority { "2019-07-17" }
    application_materials_due { "2019-07-17" }
    camper_acceptance_due { "2019-07-17" }
    active { false }
  end
end
