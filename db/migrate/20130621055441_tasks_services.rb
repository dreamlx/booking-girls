class TasksServices < ActiveRecord::Migration
  def change
    create_table :services_tasks do |t|
      t.references :task
      t.references :service
    end
    add_index :services_tasks, :task_id
    add_index :services_tasks, :service_id
  end
end
