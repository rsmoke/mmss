ActiveAdmin.register Activity do
  menu parent: 'Camp Setup', priority: 3

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :camp_occurrence_id, :description, :cost_cents, :date_occurs, :active
  #
  # or
  #
  # permit_params do
  #   permitted = [:camp_occurrence_id, :description, :cost_cents, :date_occurs, :active]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
