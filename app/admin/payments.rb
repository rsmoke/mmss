ActiveAdmin.register Payment do
  menu parent: 'Applicant Info', priority: 3

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :transaction_type, :transaction_status, :transaction_id, :total_amount, :transaction_date, :account_type, :result_code, :result_message, :user_account, :payer_identity, :timestamp, :transaction_hash, :user_id
   
  #  :amount, :transactionType, :transactionStatus, :transactionId, :transactionTotalAmount, :transactionDate, :transactionAcountType, :transactionResultCode, :transactionResultMessage, :orderNumber, :timestamp, :hash
  #
  # or
  #
  # permit_params do
  #   permitted = [:enrollment_id, :amount_cents, :source, :awarded, :note, :status]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
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
