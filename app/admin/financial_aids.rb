ActiveAdmin.register FinancialAid, as: "Financial Aid Request" do
  menu parent: 'Applicant Info', priority: 2

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :enrollment_id, :amount_cents, :source, :awarded, :note, :status
  #
  # or
  #
  # permit_params do
  #   permitted = [:enrollment_id, :amount_cents, :source, :awarded, :note, :status]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f| # This is a formtastic form builder
    f.semantic_errors # shows errors on :base
    f.inputs           # builds an input field for every attribute
    f.inputs do
      f.input :taxform, as: :file
    end
    f.actions         # adds the 'Submit' and 'Cancel' button
  end

  index do
    selectable_column
    column :id, sortable: :id do |f|
      link_to f.id, admin_financial_aid_request_path(f)
    end
    column 'Enrollment' do |e|
      link_to e.enrollment.display_name, admin_enrollment_path(e.enrollment_id)
    end
    column "Taxform" do |t|
      if t.taxform.attached?
        link_to t.taxform.filename, url_for(t.taxform)
      end
    end
    column :amount_cents
    column :source
    column :awarded
    column :note
    column :status

    actions
  end

end
