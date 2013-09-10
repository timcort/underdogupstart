class SectionsController < ApplicationController

	def new
		@product = Product.find(params[:product_id])
		@section = @product.sections.build
	end

	def create
		@product = Product.find(params[:product_id])
		@section = @product.sections.build(section_params)
		if @section.save
			flash[:success] = "Product Section has been created"
			redirect_to @product
		else
			render 'new'
		end
	end

	def show
		@product = Product.find(params[:product_id])
		@section = @product.sections.find(params[:id])
	end

	private 

		def section_params
			params.require(:section).permit(:sequence_no, :title, :description, 
				:video, :notes)
		end
end
