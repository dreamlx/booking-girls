ActiveAdmin.register Category do
  config.filters = false

  index do
    column :name
    default_actions
  end

  show do
    h3 category.name
  end

  form do |f|
    f.inputs do
      f.input :admin_user_id, as: :hidden, input_html: { value: current_admin_user.id }
      
      f.input :name
    end
    
    f.actions
  end
end
