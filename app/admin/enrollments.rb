ActiveAdmin.register Enrollment do
  menu parent: 'Applicant Info', priority: 1

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :user_id, :international, :high_school_name, :high_school_address1, :high_school_address2, :high_school_city, :high_school_state, :high_school_non_us, :high_school_postalcode, :high_school_country, :year_in_school, :anticipated_graduation_year, :room_mate_request, :personal_statement, :shirt_size, :notes, :application_status, :offer_status, :partner_program, :transcript
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :international, :high_school_name, :high_school_address1, :high_school_address2, :high_school_city, :high_school_state, :high_school_non_us, :high_school_postalcode, :high_school_country, :year_in_school, :anticipated_graduation_year, :room_mate_request, :personal_statement, :shirt_size, :notes, :application_status, :offer_status, :partner_program]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f| # This is a formtastic form builder
    f.semantic_errors # shows errors on :base
    f.inputs           # builds an input field for every attribute
    f.inputs do
      f.input :transcript, as: :file
    end
    f.actions         # adds the 'Submit' and 'Cancel' button
  end

  index do
    selectable_column
    column :id, sortable: :id do |e|
      link_to e.id, admin_enrollment_path(e)
    end
    column :user_id, sortable: :user_id do |user|
      link_to user.display_name, admin_user_path(user.user_id)
    end
    column "Transcript" do |enroll|
      if enroll.transcript.attached?
        link_to enroll.transcript.filename, url_for(enroll.transcript)
      end
    end
    column :international
    column :high_school_name
    column :high_school_address1
    column :high_school_address2
    column :high_school_city
    column :high_school_state
    column :high_school_non_us
    column :high_school_postalcode
    column :high_school_country
    column :year_in_school
    column :anticipated_graduation_year
    column :room_mate_request
    column :personal_statement
    # column :shirt_size
    column :notes
    column :application_status
    column :offer_status
    column :partner_program

    actions
  end

end
