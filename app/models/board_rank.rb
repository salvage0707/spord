class BoardRank < ApplicationRecord
	belongs_to :rank
	belongs_to :board
end
