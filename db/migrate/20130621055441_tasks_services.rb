class TasksServices < ActiveRecord::Migration
  def change
    create_table :tasks_services do |t|
      t.references :task
      t.references :service

      t.timestamps
    end
    add_index :tasks_services, :task_id
    add_index :tasks_services, :service_id
  end
end
