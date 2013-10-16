class LineItem < ActiveRecord::Base
	belongs_to :product
	belongs_to :cart
	validates :product_id, presence: true
	validates :cart_id, presence: true
end
