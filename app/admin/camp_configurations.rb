ActiveAdmin.register CampConfiguration do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :camp_year, :application_open, :application_close, :priority, :application_materials_due, :camper_acceptance_due, :active
  #
  # or
  #
  # permit_params do
  #   permitted = [:camp_year, :application_open, :application_close, :priority, :application_materials_due, :camper_acceptance_due, :active]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
