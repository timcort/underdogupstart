class ProductsController < ApplicationController

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			flash[:success] = "Product has been created"
			redirect_to @product
		else
			render 'new'
		end
	end

	def show
		@product = Product.find(params[:id])
		@section = @product.sections.find_by_id(params[:id])
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
		if @product.update_attributes(product_params)
			flash.now[:success] = "Product updated"
			render 'edit'
		else
			render 'edit'
		end	
	end


	  private

	  def product_params
	  	params.require(:product).permit(:title, :heading, :sub_heading, :price, 
	  								 :demo_vid, :benefits)
	  end
end