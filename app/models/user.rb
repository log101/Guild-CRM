class User < ApplicationRecord
	has_many :tags, dependent: :destroy
	has_secure_password

	has_many :invited_invitations, :class_name => 'Invitation', :foreign_key => "invited_id", dependent: :destroy
	has_many :sending_intivations, :class_name => 'Invitation', :foreign_key => "sender_id", dependent: :destroy
	has_many :user_contacts

	validates :username, presence: true, uniqueness: true, length: {minimum: 6}
	validates :password, confirmation:true, presence: true, length: {minimum: 6}
	validates :password_confirmation, presence: true
	validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "should be valid" }

	extend FriendlyId
		friendly_id :username
end
