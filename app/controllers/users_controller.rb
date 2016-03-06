class UsersController < ApplicationController
	def index
	end
	
	def new
		@user = User.new
	end
	
	def show
		@user = User.find(params[:id])		
	end
	
	def create
		puts params.inspect
		@user = User.new(user_params)
	  if @user.save
			session[:user_id]= @user.id
	    redirect_to @user
	  else
	  	redirect_to new_user_path
	  end
	end

	def edit
	
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
	def user_params
		params.require(:user).permit(:username, :password, :email)

	end
end
