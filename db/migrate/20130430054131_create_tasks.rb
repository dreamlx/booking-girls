class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.datetime :starttime
      t.datetime :endtime
      t.integer :girl_id
      t.string :title

      t.timestamps
    end
  end
end
