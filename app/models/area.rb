class Area < ApplicationRecord
	belongs_to :region
	has_many :users
	has_many :boards
	has_many :communities
end
