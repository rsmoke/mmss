ActiveAdmin.register CoursePreference do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :enrollment_id, :course_id, :ranking
  #
  # or
  #
  # permit_params do
  #   permitted = [:enrollment_id, :course_id, :ranking]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end