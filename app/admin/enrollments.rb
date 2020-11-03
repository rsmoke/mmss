ActiveAdmin.register Enrollment, as: "Application" do
  menu parent: 'Applicant Info', priority: 1

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params  :user_id, :international, 
                  :high_school_name, :high_school_address1, 
                  :high_school_address2, :high_school_city, 
                  :high_school_state, :high_school_non_us, 
                  :high_school_postalcode, :high_school_country, 
                  :year_in_school, :anticipated_graduation_year, 
                  :room_mate_request, :personal_statement, 
                  :shirt_size, :notes, :application_status, 
                  :offer_status, :partner_program, :transcript, :student_packet,
                  session_assignments_attributes: [:id, :camp_occurrence_id, :_destroy ],
                  course_assignments_attributes: [:id, :course_id, :_destroy ]
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
    #  panel "Upload Details" do
    #   render("/admin/testing_partial_display")
    #   end

      table_for application do
        column "Current Transcript" do |item| 
          if item.transcript.attached?
            link_to item.transcript.filename, url_for(item.transcript)
          end
        end
        column "Current Student Packet" do |item| 
          if item.student_packet.attached?
            link_to item.student_packet.filename, url_for(item.student_packet)
          end
        end
      end
     f.input :transcript, as: :file, label: "Update transcript"
     f.input :student_packet, as: :file, label: "Update student_packet"
      hr
     f.input :notes
     f.input :partner_program
    end
 
    f.inputs do
      f.semantic_errors
      f.has_many :session_assignments, heading: 'Session Assignments',
                  allow_destroy: true,
                  new_record: true do |a|
                    a.input :offer_status, input_html: { disabled: true }
                    a.input :camp_occurrence_id, as: :select, collection: application.session_registrations
                  end
    end

    f.inputs do
      f.semantic_errors
      f.has_many :course_assignments, heading: 'Course Assignments',
                  allow_destroy: true,
                  new_record: true do |a|
                    # a.input :course_id, as: :select, collection: application.course_registrations
                    a.input :course_id, as: :select, collection:
                    application.course_registrations.order(:camp_occurrence_id).map{|u| ["#{u.title}, #{u.camp_occurrence.description}, 
                    rank - #{application.course_preferences.find_by(course_id: u.id).ranking}", u.id]}
                  end
    end
        
    f.inputs do
      f.input :offer_status, as: :select, collection: ['accepted','declined','offered','none']
      f.input :application_status, as: :select, collection: ['enrolled', 'new', 'none', 'registered', 'submitted']
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
    column "Student Packet" do |sp|
      if sp.student_packet.attached?
        link_to sp.student_packet.filename, url_for(sp.student_packet)
      end
    end
    column :offer_status
    column :application_status
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
      row :offer_status
      row :application_status
      row :partner_program
    end
    # panel "Sessions" do

      panel "Session Assignment" do
        table_for application.session_assignments do
          column(:id) { |item| link_to(item.id, admin_session_assignment_path(item)) }
          column(:camp_occurrence_id) { |item| item.camp_occurrence.description }
          column(:offer_status)
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
      if application.recommendation.present?
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
      row :student_packet do |sp|
        if sp.student_packet.attached?
          link_to sp.student_packet.filename, url_for(sp.student_packet)
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
