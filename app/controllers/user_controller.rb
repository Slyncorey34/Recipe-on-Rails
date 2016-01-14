class UserController < ApplicationController

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id]=@user.user_idredirect to @user_idelse
				redirect_to @user
		else
			redirect_to new_user_path
		end
	end

	def new
		@user = User.new
	end

	def edit
	
		@user = User.find(params[:id])
	end

	def show
		@user = User.find(params[:id])		
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to @user
		else
			redirect_to(edit_path)
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		session.destroy
		redirect_to users_path
	end

private
	def params
		params.require(:user).permit(:user, :email, :password)

	end
end
