ActiveAdmin.register AdminUser do
  
  index do
    column :id
    column :role
    column :email
    column :role
    column :company
    actions
  end

  form do |f|
    f.inputs "detail" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :company
      f.input :role
    end
    
    f.actions
  end  
end
