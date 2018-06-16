class MySport < ApplicationRecord
	belongs_to :user
	belongs_to :sport
	belongs_to :rank
end
