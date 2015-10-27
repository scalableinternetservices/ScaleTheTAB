class Item < ActiveRecord::Base
	belongs_to :menu



	validates :title, :price, presence: true
	validates :price, numericality: {greater_than_or_equal_to: 0.01}
	validates :title, uniqueness: true
	validates :image_url, allow_blank: true, format: {
		with: %r{\.(gif|jpg|png\Z)}i,
		message: 'must be a URL for GIF, JPG, PNG'
	}
end
