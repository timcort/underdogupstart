class Section < ActiveRecord::Base
	belongs_to :product
	validates :product_id, presence: true
	validates :sequence_no, presence: true
	validates :title, presence: true
	validates :description, presence: true
	validates :video, presence: true
	validates :notes, presence: true
end
