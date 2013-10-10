ActiveAdmin.register Company do
  actions :all, :except => [:new]
  form do |f|
    f.inputs do
      f.input :admin_user_id, as: :hidden, input_html: { value: current_admin_user.id }
      
      f.input :name
      f.input :address
      f.input :phone
      f.input :avatar, as: :file
    end
    f.actions
  end
end