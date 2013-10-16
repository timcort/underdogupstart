module CurrentCart
	extend ActiveSupport::Concern

	private

		def set_cart
			@cart = Cart.find(user_session[:cart_id])
		rescue ActiveRecord::RecordNotFound 
			@cart = Cart.create 
			user_session[:cart_id] = @cart.id
		end 
end