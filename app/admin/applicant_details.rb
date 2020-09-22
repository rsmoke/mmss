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
  index do 
    selectable_column
    column :id, sortable: :id do |e|
      link_to "Full #{e.id}", admin_applicant_detail_path(e)
    end
    column :user_id, sortable: :user_id do |user|
      link_to user.applicant_email, admin_user_path(user.user_id)
    end
    column :firstname
    column :middlename
    column :lastname
    column :gender do |g|
      g.gender_name
    end
    column :us_citizen
    column :demographic do |d| 
      d.demographic_name
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
    column :parentname
    # column :parentaddress1
    # column :parentaddress2
    # column :parentcity
    # column :parentstate
    # column :parentstate_non_us
    # column :parentzip
    # column :parentcountry
    column :parentphone
    column :parentworkphone
    column :parentemail
    column :created_at
    column :updated_at
    actions
  end
end
