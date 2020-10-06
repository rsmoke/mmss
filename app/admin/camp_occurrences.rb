ActiveAdmin.register CampOccurrence, as: "Session Configurations" do
  menu parent: 'Camp Setup', priority: 2

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :camp_configuration_id, :description, :cost_cents, :begin_date, :end_date, :active
  #
  # or
  #
  # permit_params do
  #   permitted = [:camp_configuration_id, :description, :begin_date, :end_date, :active]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
