class TestsController < ApplicationController

	before_action :set_item, only: [:edit, :show, :update, :destroy]

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
	end

	def edit
	end

	def update
		if @test.update(test_params)
			flash[:notice] = "Item was updated Successfully!"
			redirect_to test_path(@test)
		else
			render 'edit'
		end
	end

	def index
		@tests = Test.all
	end

	def destroy
		@test.destroy
		flash[:notice] = "Item was deleted Successfully!"

		redirect_to tests_path
	end

	def set_item
		@test = Test.find(params[:id])
	end

	private
		def test_params
			params.require( :test).permit( :name, :description)
		end

end