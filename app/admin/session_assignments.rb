ActiveAdmin.register SessionAssignment do
  menu parent: 'Applicant Info', priority: 1

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
 permit_params :enrollment_id, :camp_occurrence_id, :offer_status
  #
  # or
  #
  # permit_params do
  #   permitted = [:enrollment_id, :camp_occurrence_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    f.inputs do
      f.input :enrollment_id, as: :select, collection: Enrollment.all
      f.input :camp_occurrence_id, as: :select, collection: CampOccurrence.active
      f.input :offer_status, as: :select, collection: ['accepted','declined']
    end
    f.actions
  end

  filter :enrollment_id, as: :select, collection: Enrollment.all
  filter :camp_occurrence_id, as: :select, collection: CampOccurrence.active.no_any_session
  filter :offer_status, as: :select
end

