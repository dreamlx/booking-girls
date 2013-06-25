class TasksServices < ActiveRecord::Migration
  def change
    create_table :tasks_service_menus do |t|
      t.references :task
      t.references :service_menu
    end
    add_index :tasks_service_menus, :task_id
    add_index :tasks_service_menus, :service_menu_id
  end
end
