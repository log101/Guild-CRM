class UserContact < ApplicationRecord
  belongs_to :user
	belongs_to :company

	#validates_uniqueness_of :email, scope: :company_id, :message => "already added to contacts"
end
