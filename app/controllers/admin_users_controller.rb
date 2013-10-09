# coding: utf-8
class AdminUsersController < ApplicationController
	def index
	end

	def new
		@admin_user = AdminUser.new
	end

	def create
		@admin_user = AdminUser.new(params[:admin_user])
    respond_to do |format|
      if @admin_user.save
        format.html { redirect_to admin_users_path, notice: '创建商家管理员成功，请登录后台' }
      else
        format.html { render action: "new" }
      end
    end
	end
end
