class HomeController < ApplicationController
	def index
		@group = Group.new
	end

	def profile
		@user = User.find_by(username: params[:username])
	end

	def add_friend
		@current_user = User.find_by(id: params[:current_user_id])
		@user = User.find_by(id: params[:user_id])
		@current_user.friend_request(@user)
		redirect_back(fallback_location: root_path)
	end
	def accept_friend
		@current_user = User.find_by(id: params[:current_user_id])
		@user = User.find_by(id: params[:user_id])
		@current_user.accept_request(@user)
		redirect_back(fallback_location: root_path)
	end
	def decline_friend
		@current_user = User.find_by(id: params[:current_user_id])
		@user = User.find_by(id: params[:user_id])
		@current_user.decline_request(@user)
		redirect_back(fallback_location: root_path)
	end
	def remove_friend
		@current_user = User.find_by(id: params[:current_user_id])
		@user = User.find_by(id: params[:user_id])
		@current_user.remove_friend(@user)
		redirect_back(fallback_location: root_path)
	end
	def block_friend
		@current_user = User.find_by(id: params[:current_user_id])
		@user = User.find_by(id: params[:user_id])
		@current_user.block_friend(@user)
		redirect_back(fallback_location: root_path)
	end
	def unblock_friend
		@current_user = User.find_by(id: params[:current_user_id])
		@user = User.find_by(id: params[:user_id])
		@current_user.unblock_friend(@user)
		redirect_back(fallback_location: root_path)
	end
end
