class Tag < ApplicationRecord
  belongs_to :user, optional: true
	belongs_to :company, optional: true
	
	validates :body, presence: true, length: { minimum: 3 }
	validates_uniqueness_of :body, scope: :user_id
end
