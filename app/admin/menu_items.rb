ActiveAdmin.register MenuItem do
  filter :category
  filter :title
  index do
    column :category
    column :avatar do |item|
      image_tag item.avatar_url, size: '128x128'
    end
    column :title
    column :price
    column :desc
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :admin_user_id, as: :hidden, input_html: { value: current_admin_user.id }
      f.input :title
      f.input :category_id, as: :select, :collection => Category.where("admin_user_id = #{current_admin_user.id}")
      f.input :price
      f.input :desc
      f.input :avatar, as: :file
    end
    f.actions
  end
end
