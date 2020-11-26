ActiveAdmin.register ApplicantDetail do
  menu parent: 'Applicant Info', priority: 1

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :user_id, :firstname, :middlename, :lastname, :gender, :us_citizen, :demographic, :birthdate, :diet_restrictions, :shirt_size, :address1, :address2, :city, :state, :state_non_us, :postalcode, :country, :phone, :parentname, :parentaddress1, :parentaddress2, :parentcity, :parentstate, :parentstate_non_us, :parentzip, :parentcountry, :parentphone, :parentworkphone, :parentemail
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :firstname, :middlename, :lastname, :gender, :us_citizen, :demographic, :birthdate, :diet_restrictions, :shirt_size, :address1, :address2, :city, :state, :state_non_us, :postalcode, :country, :phone, :parentname, :parentaddress1, :parentaddress2, :parentcity, :parentstate, :parentstate_non_us, :parentzip, :parentcountry, :parentphone, :parentworkphone, :parentemail]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form do |f| # This is a formtastic form builder
    f.semantic_errors # shows errors on :base
    # f.inputs           # builds an input field for every attribute
    f.actions 
    f.inputs do
      f.input :user_id, as: :select, collection: User.all
      f.input :firstname
      f.input :middlename
      f.input :lastname
      f.input :gender, as: :select, collection: Gender.all
      f.input :us_citizen
      f.input :demographic, as: :select, collection: Demographic.all
      f.input :birthdate
      f.input :diet_restrictions
      f.input :shirt_size
      f.input :address1
      f.input :address2
      f.input :city
      f.input :state, as: :select, collection: us_states
      f.input :state_non_us
      f.input :postalcode
      f.input :country
      f.input :phone
      f.input :parentname
      f.input :parentaddress1
      f.input :parentaddress2
      f.input :parentcity
      f.input :parentstate, as: :select, collection: us_states
      f.input :parentstate_non_us
      f.input :parentzip
      f.input :parentcountry, include_blank: true
      f.input :parentphone
      f.input :parentworkphone
      f.input :parentemail
    end
  end

  filter :gender, as: :select, collection: Gender.all.map{|a| [a.name, a.id]}
  filter :demographic, as: :select, collection: Demographic.all.map{|a| [a.name, a.id]}
  # filter :state, as: :select
  # filter :firstname, as: :select
  # filter :middlename
  filter :lastname, as: :select

  filter :us_citizen

  filter :birthdate
  filter :diet_restrictions
  filter :shirt_size, as: :select
  # filter :address1
  # filter :address2
  # filter :city

  # filter :state_non_us
  # filter :postalcode
  # filter :country, as: :select
  # filter :phone
  filter :parentname
  # filter :parentaddress1
  # filter :parentaddress2
  # filter :parentcity
  # filter :parentstate
  # filter :parentstate_non_us
  # filter :parentzip
  # filter :parentcountry
  # filter :parentphone
  # filter :parentworkphone
  # filter :parentemail

  index do 
    selectable_column
    actions
    # column :id
    # column :user_id, sortable: :user_id do |user|
    #   link_to user.applicant_email, admin_user_path(user.user_id)
    # end
    # column :firstname
    # column :middlename
    # column :lastname
    column "Fullname" do |appdetail|
      appdetail.full_name
    end
    column('eMail') do |app| 
      div(title: 'Link to Application') do
        link_to app.applicant_email, admin_application_path(app.user.enrollments.last) 
      end
    end
    column :gender do |g|
      g.gender_name
    end
    column :us_citizen
    column :demographic do |d| 
     # if d.exists?
        d.demographic_name
     # end
    end
    column :birthdate
    column :diet_restrictions
    column :shirt_size
    column :address1
    column :address2
    column :city
    column :state
    column :state_non_us
    column :postalcode
    column :country
    column :phone
    # column :parentname
    # column :parentaddress1
    # column :parentaddress2
    # column :parentcity
    # column :parentstate
    # column :parentstate_non_us
    # column :parentzip
    # column :parentcountry
    # column :parentphone
    # column :parentworkphone
    # column :parentemail
    column :created_at
    column :updated_at
    # actions
  end

  # show do
  #   attributes_table do
  #     row :id
  #     row :email
  #     row :firstname
  #     row :middlename
  #     row :lastname
  #     row :gender do |g|
  #       g.gender_name
  #     end

  #     row :created_at
  #     row :updated_at
  #   end
  #   active_admin_comments
  # end
  show do
    panel "Applications" do
      table_for applicant_detail do
        column :firstname
        column :lastname
        column :gender do |g|
          g.gender_name
        end
        # column :user_id do |user|
        #   link_to user.applicant_email, admin_user_path(user.user_id)
        # end
        # column('eMail') { |user| link_to user.applicant_email, admin_user_path(user.user_id) }
        column('eMail') do |app| 
          div(title: 'Link to Application') do
            link_to app.applicant_email, admin_application_path(app.user.enrollments.last) 
          end
        end
      end
    end
    active_admin_comments
  end

  sidebar "Details", only: :show do
    attributes_table_for applicant_detail do
      row :id
      row :gender do |g|
        g.gender_name
      end
      row :birthdate
      row :diet_restrictions
      row :shirt_size
      row :address1
      row :address2
      row :city
      row :state
      row :state_non_us
      row :postalcode
      row :country
      row :phone
      row :parentname
      # column :parentaddress1
      # column :parentaddress2
      # column :parentcity
      # column :parentstate
      # column :parentstate_non_us
      # column :parentzip
      # column :parentcountry
      row :parentphone
      row :parentworkphone
      row :parentemail
      # row('Published?') { |b| status_tag b.published? }
    end
  end
end
