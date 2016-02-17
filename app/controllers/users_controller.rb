# Controller: Users
class UsersController < ApplicationController

	def new
		# goes to views/users/new.html.erb
	end

	def show
		@user = User.find(params[:id])
		# session[:user_id] = User.find(params[:id]).id
		@userComments = Comment.where(user_id:params[:id]) # Find all comments made by current user
		@allComments = Comment.where.not(user_id:params[:id]) # Find all comments excluding current user
		@user_Comment_Count = Comment.where(user_id:params[:id]).count # Count how many comments current user made

	end

	def login
		@user = User.find_by_email(params[:email])

		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
			redirect_to '/users/%d' % session[:user_id]
		else
			flash[:errors] = ["Invalid combination"]
			redirect_to '/users/new'
		end
	end

	def comment
		Comment.create(comments:params[:comments], user: User.find(params[:id]))
		# redirect_to '/users/%d' % session[:user_id]
		redirect_to :back
	end

	def like
		Like.create(user: User.find(session[:user_id]), comment: Comment.find(params[:id]))
		redirect_to '/users/%d' % session[:user_id]
	end

	def destroy
		comment_destroy = Comment.find(params[:id])
		comment_destroy.destroy
		# redirect_to '/users/%d' % session[:user_id]
		redirect_to :back
	end


	private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
end
