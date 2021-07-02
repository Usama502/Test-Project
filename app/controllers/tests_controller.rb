class TestsController < ApplicationController

	def new
		@test = Test.new
	end

	def create
		@test = Test.new(test_params)
		
		if @test.save
			flash[:notice] = "Item was created Successfully!"
			redirect_to test_path(@test)
		else
			render 'new'
		end
	end

	def show
		@test = Test.find(params[:id])
	end

	private
		def test_params
			params.require( :test).permit( :name, :description)
		end


end