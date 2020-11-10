ActiveAdmin.register CampConfiguration do
  menu parent: 'Camp Setup', priority: 1

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :camp_year, :application_open, :application_close, :priority, :application_materials_due, :camper_acceptance_due, :active, :offer_letter, :student_packet_url, :application_fee_cents
  #
  # or
  #
  # permit_params do
  #   permitted = [:camp_year, :application_open, :application_close, :priority, :application_materials_due, :camper_acceptance_due, :active]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do
    selectable_column
    actions
    column :camp_year
    column :application_open
    column :application_close
    column :priority
    column :application_materials_due
    column :camper_acceptance_due
    column :active
    column :offer_letter
    column :student_packet_url
    column "Application Fee" do |af|
      humanized_money_with_symbol(af.application_fee)
    end

  end
end
