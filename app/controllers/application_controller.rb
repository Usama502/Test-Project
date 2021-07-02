class ApplicationController < ActionController::Base
	layout "application"
	def hello
		render plain: "Hello World"
	end

end
