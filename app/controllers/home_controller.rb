class HomeController < ApplicationController
	def index
		@group = Group.new
	end
end
