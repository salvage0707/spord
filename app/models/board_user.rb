class BoardUser < ApplicationRecord
	belongs_to :user
	belongs_to :board

	validates :comment, presence: true
end
