ActiveAdmin.register User do
  
  index do
    column :id
    column :name
    column :email
    column :role
    column :company
    actions
  end

  form do |f|
    f.inputs "detail" do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :company
      f.input :role
    end
    
    f.actions
  end  
end
