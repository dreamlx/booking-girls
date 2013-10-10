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
      f.input :title
      f.input :category
      f.input :price
      f.input :desc
      f.input :avatar, as: :file
    end
    f.actions
  end
end
