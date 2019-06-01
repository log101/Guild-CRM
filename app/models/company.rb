class Company < ApplicationRecord
	belongs_to :user, :foreign_key => 'owner_id'
 	has_many :workers, dependent: :destroy
	has_many :tags, dependent: :destroy
	has_many :invitations, dependent: :destroy
	
	has_many :contacts, :class_name => 'CompanyContact', 
		:foreign_key => "company_id", dependent: :destroy
	has_many :owned_contacts, :class_name => 'CompanyContact',
		:foreign_key => "contact_owner_id", dependent: :destroy
	
	has_many :user_contacts, dependent: :destroy

	validates :owner_id, presence: true
	validates_uniqueness_of :name, scope: :owner_id, 
		:message => "already created!"
	validates :name, presence: true, length: { minimum: 5 }
	validates :description, length: { minimum: 40 }, allow_blank: true
	extend FriendlyId
		friendly_id :name
end
