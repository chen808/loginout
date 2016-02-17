# Controller: Sessions
class SessionsController < ApplicationController

	def new
	end

	def create
		User.create(first_name:params[:first_name],last_name:params[:last_name],email:params[:email],password:params[:password])

		user = User.find_by_email(params[:email])

		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to '/users/%d' % session[:user_id]
		else
			flash[:errors] = ["Invalid combination"]
			redirect_to '/sessions/new'
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to '/sessions/new'
	end








end
