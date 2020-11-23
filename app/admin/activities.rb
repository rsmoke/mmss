ActiveAdmin.register Activity do
  menu parent: 'Camp Setup', priority: 3

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :camp_occurrence_id, :description, :cost_cents, :date_occurs, :active
  #
  # or
  #
  # permit_params do
  #   permitted = [:camp_occurrence_id, :description, :cost_cents, :date_occurs, :active]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end


  # form do |f| # This is a formtastic form builder
  #   f.semantic_errors # shows errors on :base
  #   # f.inputs           # builds an input field for every attribute
  #   f.inputs do
  #     f.input :camp_occurrence_id, as: :select, collection: CampOccurrence.all
  #     f.input :description
  #     f.input :cost_cents
  #     f.input :date_occurs
  #     f.input :active
  #   end
  #   f.actions         # adds the 'Submit' and 'Cancel' button
  # end
  filter :camp_occurrence_id, label: "Session", as: :select, collection: CampOccurrence.order(begin_date: :desc).no_any_session
  filter :description, as: :select
  filter :cost_cents
  filter :date_occurs
  filter :active



  index do
    selectable_column
    actions
    column "Camp Occurrence" do |ca|
      ca.camp_occurrence
    end
    column :description
    column "Cost" do |af|
      humanized_money_with_symbol(af.cost)
    end
    column :date_occurs
    column :active
    column :created_at
    column :updated_at
  end

  show do
    attributes_table do
      row "Camp Occurrence" do |ca|
        ca.camp_occurrence
      end
      row :description
      row "Cost" do |af|
        humanized_money_with_symbol(af.cost)
      end
      row :date_occurs
      row :active
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end
end
