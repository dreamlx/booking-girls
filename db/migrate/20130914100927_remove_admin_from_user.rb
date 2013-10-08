class RemoveAdminFromUser < ActiveRecord::Migration
	User.all.each do |user|
		user.role = 'admin' if user.admin?
	end
  def change
  	remove_column :users, :admin
  end
end
