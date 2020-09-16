ActiveAdmin.register Enrollment, as: "Application" do
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
    # f.inputs           # builds an input field for every attribute
    f.inputs do
     f.input :user_id, as: :select, collection: User.all
     f.input :international
     f.input :high_school_name
     f.input :high_school_address1
     f.input :high_school_address2
     f.input :high_school_city
     f.input :high_school_state, as: :select, collection: us_states
     f.input :high_school_non_us
     f.input :high_school_postalcode
     f.input :high_school_country
     f.input :year_in_school
     f.input :anticipated_graduation_year
     f.input :room_mate_request
     f.input :personal_statement
     f.input :transcript, as: :file
     f.input :notes
     f.input :application_status, as: :select, collection: ['enrolled', 'new', 'none', 'registered', 'submitted']
     f.input :offer_status, as: :select, collection: ['accepted','declined','offered','none']
     f.input :partner_program
   end
    f.actions         # adds the 'Submit' and 'Cancel' button
  end

  index do
    selectable_column
    column :id, sortable: :id do |e|
      link_to e.id, admin_application_path(e)
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
    column :personal_statement do |ps|
      truncate(ps.personal_statement, omision: "...", length: 50)
    end
    column :notes
    column :application_status
    column :offer_status
    column :partner_program

    actions
  end

  show do
    attributes_table do
      row :id
      row :user_id do |user| user.display_name end
      row :transcript do |tr|
        if tr.transcript.attached?
          link_to tr.transcript.filename, url_for(tr.transcript)
        end
      end
      row :international
      row :high_school_name
      row :high_school_address1
      row :high_school_address2
      row :high_school_city
      row :high_school_state
      row :high_school_non_us
      row :high_school_postalcode
      row :high_school_country
      row :year_in_school
      row :anticipated_graduation_year
      row :room_mate_request
      row :personal_statement
      row :notes
      row :application_status
      row :offer_status
      row :partner_program
    end
    active_admin_comments
  end

end
