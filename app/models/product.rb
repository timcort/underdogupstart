class Product < ActiveRecord::Base
	validates :title, presence: true
	validates :heading, presence: true
	validates :sub_heading, presence: true
	validates :price, presence: true
	validates :demo_vid, presence: true
	validates :benefits, presence: true
end