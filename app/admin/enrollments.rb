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

  scope :all, :default => true
  scope :offered
  scope :accepted

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
     render('/admin/application_session_assignment_form', model: "enrollments")
     render('/admin/application_course_assignment_form', model: "enrollments")
   end
    f.actions         # adds the 'Submit' and 'Cancel' button
  end

  index do
    selectable_column
    actions
    column('eMail') { |application| link_to application.user.email, admin_user_path(application.user_id) }
    # column :user_id, sortable: :user_id do |user|
    #   link_to user.display_name, admin_applicant_details_path(:user_id)
    # end
    column "Transcript" do |enroll|
      if enroll.transcript.attached?
        link_to enroll.transcript.filename, url_for(enroll.transcript)
      end
    end
    column :application_status
    column :offer_status
    column :international
    # column :high_school_name
    # column :high_school_address1
    # column :high_school_address2
    # column :high_school_city
    # column :high_school_state
    # column :high_school_non_us
    # column :high_school_postalcode
    # column :high_school_country
    column :year_in_school
    column :anticipated_graduation_year
    column :room_mate_request
    column :personal_statement, sortable: false do |ps|
      truncate(ps.personal_statement, omision: "...", length: 25)
    end
    column :notes
    column :partner_program
  end

  show do
    attributes_table do
      row :user_id do |user| link_to(user.applicant_detail.full_name.titleize, admin_applicant_detail_path(user.applicant_detail)) end
      # row link_to application.user.email, admin_user_path(application.user_id) 
      # link_to(enroll.user.email, admin_applicant_detail_path(enroll.user.applicant_detail))
      # row :id
      # row :user_id do |user| user.display_name end
      # row :transcript do |tr|
      #   if tr.transcript.attached?
      #     link_to tr.transcript.filename, url_for(tr.transcript)
      #   end
      # end
      # row :international
      # row :high_school_name
      # row :high_school_address1
      # row :high_school_address2
      # row :high_school_city
      # row :high_school_state
      # row :high_school_non_us
      # row :high_school_postalcode
      # row :high_school_country
      # row :year_in_school
      # row :anticipated_graduation_year
      # row :room_mate_request
      row :personal_statement
      row :notes
      row :application_status
      row :offer_status
      row :partner_program
    end
    # panel "Sessions" do

      panel "Session Assignment" do
        table_for application.session_assignments do
          column(:id) { |item| link_to(item.id, admin_session_assignment_path(item)) }
          column(:camp_occurrence_id) { |item| item.camp_occurrence.description }
          # column "Assigned Sessions" do |item| 
          #   item.description 
          # end
        end

        table_for application.session_registrations do
          column "User Selected Sessions" do |item| 
            item.description 
          end
        end
      end

      panel "Activities/Services" do
        table_for application.enrollment_activities do
          column(:activity_id) { |item| item.activity.description }
          column "Session" do |item| 
            item.activity.camp_occurrence.description 
          end
        end
      end
      panel "Course Assignment" do
        table_for application.course_assignments do
          column(:id) { |item| link_to(item.id, admin_course_assignment_path(item)) }
          column(:course_id) { |item| item.course.title }
          column "Session" do |item| 
            item.course.camp_occurrence.description 
          end
        end

      # panel "Course Preferences" do
        table_for application.course_preferences do
          # column(:course_id) { |item| item.course.title }
          column "User Course Preference" do |item| 
            item.course.title 
          end
          column "Rank" do |item| 
            item.ranking 
          end
          column "Session" do |item| 
            item.course.camp_occurrence.description 
          end
        end
      end
    # end

    panel "Payment Activity" do
      table_for application.user.payments do
        column(:id) { |aid| link_to(aid.id, admin_payment_path(aid.id)) }
        column(:account_type) { |atype| atype.account_type.titleize }
        column(:transaction_date) {|td| Date.parse(td.transaction_date) }
        column(:total_amount) { |ta|  humanized_money_with_symbol(ta.total_amount.to_f / 100) }
      end
    end

    panel "Recommendation" do
      table_for application.recommendation do
        column(:id)  { |recc| link_to(recc.id, admin_recommendation_path(recc.id)) }
        column :firstname 
        column :lastname
        column :organization
        column "Letter" do |item|
          if item.recupload.present?
           link_to("view", admin_recupload_path(item.recupload))
          else
            "- waiting for response"
          end
        end
      end

    end

    if application.financial_aid.present?
      panel "Financial Aid Request" do
        table_for application.financial_aid do
          column "Request" do |item|
            if item.present?
            link_to("view", admin_financial_aid_request_path(item))
            end
          end
          column "Awarded" do |item|
            if item.present?
            item.awarded
            end
          end

        end
      end
    end

    active_admin_comments
  end

  sidebar "Details", only: :show do
    attributes_table_for application do
      row :id
      # row :user_id do |user| user.display_name end
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
  
    end
  end

end
