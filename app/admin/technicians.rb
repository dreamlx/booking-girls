ActiveAdmin.register Technician do
  index do
    column :id
    column :name
    column :age
    column :desc
    column :state
    actions
  end

  form do |f|
    f.inputs "detail" do
      f.input :name
      f.input :age
      f.input :desc
      f.input :state
    end
    
    f.actions
  end  
end
