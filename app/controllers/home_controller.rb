class HomeController < ApplicationController
	def index
		@user=User.new
		# As soon as a user engages with the site and starts requesting pages, 
		# an instance of that user is activated. See UserController
	end

end

