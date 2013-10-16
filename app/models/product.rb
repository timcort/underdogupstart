class Product < ActiveRecord::Base
	has_many :sections, dependent: :destroy
	has_many :line_items
	has_many :account_items, dependent: :destroy
	validates :title, presence: true
	validates :heading, presence: true
	validates :sub_heading, presence: true
	validates :price, presence: true
	validates :demo_vid, presence: true
	validates :benefits, presence: true
end
