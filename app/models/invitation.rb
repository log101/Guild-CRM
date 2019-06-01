class Invitation < ApplicationRecord
	belongs_to :sender, :class_name => 'User'
	belongs_to :invited, :class_name => 'User'	
	belongs_to :company, :foreign_key => "company_id"

	validates_uniqueness_of :invited_id, scope: :company_id, :message => "already invited"
end
