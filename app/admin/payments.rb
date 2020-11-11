ActiveAdmin.register Payment do
  menu parent: 'Applicant Info', priority: 3

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :user_id, :total_amount, :transaction_type, :transaction_status, :transaction_id, :transaction_date, :account_type, :result_code, :result_message, :user_account, :timestamp, :transaction_hash
  #
  # or
  #
  # permit_params do
  #   permitted = [:enrollment_id, :amount_cents, :source, :awarded, :note, :status]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  actions :index, :show, :new, :create, :update, :edit
  form do |f| # This is a formtastic form builder
    f.semantic_errors # shows errors on :base
    # f.inputs           # builds an input field for every attribute
    f.inputs do
      f.input :user_id, as: :select, collection: User.all
      f.input :total_amount
      f.input :transaction_type, input_html: {value: "1"}
      f.input :transaction_status, input_html: {value: "1"}
      f.input :transaction_id
      f.input :account_type
      f.input :result_message
      f.input :transaction_date, input_html: {value: "#{DateTime.now.strftime('%Y%m%d%H%M')}"}
      # f.object.transaction_date = DateTime.now.strftime('%Y%m%d%H%M') unless f.object.persisted?
      # f.object.transaction_date ||= unless f.object.new_record?
      # if f.object.new_record?
      #   input_html: {value: "#{DateTime.now.strftime('%Y%m%d%H%M')}"}
      # end


    end
    f.actions         # adds the 'Submit' and 'Cancel' button
  end

  index do
    actions
    column "User" do |p|
      p.user
    end
    column "Type" do |tt|
      tt.transaction_type
    end
    column "Status" do |ts|
      ts.transaction_status
    end
    column :transaction_id  
    column "Total Amount" do |p|
      humanized_money_with_symbol(p.total_amount.to_i / 100)
    end  
    column :transaction_date
    column :account_type    
    column :result_code     
    column :result_message  
    column :user_account    
    column :payer_identity  
    column :timestamp       
    column :transaction_hash 
 
  end

end
