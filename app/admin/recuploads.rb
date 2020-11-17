ActiveAdmin.register Recupload do
  menu parent: 'Applicant Info', priority: 3

  config.filters = false
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :letter, :authorname, :studentname, :recommendation_id, :rechash, :recletter
  #
  # or
  #
  # permit_params do
  #   permitted = [:enrollment_id, :email, :lastname, :firstname, :organization, :address1, :address2, :city, :state, :state_non_us, :postalcode, :country, :phone_number, :best_contact_time, :submitted_recommendation, :date_submitted]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :recommendation_id, as: :select, collection: Recommendation.all
      f.input :letter
      f.input :recletter, as: :file
      f.input :authorname
      f.input :studentname
    end
    f.actions
  end

  index do
    selectable_column
    column :id, sortable: :id do |e|
      link_to e.id, admin_recupload_path(e)
    end
    column :recommendation_id, sortable: :recommendation_id do |ri|
      link_to ri.recommendation_id, admin_recommendation_path(ri.recommendation_id)
    end
    column :studentname
    column :letter
    column "Attached File" do |reclet|
      if reclet.recletter.attached?
        link_to reclet.recletter.filename, url_for(reclet.recletter)
      end
    end
    column :authorname
    actions
  end

  show do
    attributes_table do
      row :id
      row  :recommendation_id do |ri|
        link_to ri.recommendation_id, admin_recommendation_path(ri.recommendation_id)
      end
      row :studentname
      row :letter
      row :recletter do |rl|
        if rl.recletter.attached?
          link_to rl.recletter.filename, url_for(rl.recletter)
        end
      end
      row :authorname

    end
    active_admin_comments
  end

end
