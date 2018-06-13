class UserPurpose < ApplicationRecord
	belongs_to :user
	belongs_to :purpose

end
