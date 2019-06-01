class Worker < ApplicationRecord
  belongs_to :user
  belongs_to :company

	validates_uniqueness_of :user_id, scope: :company_id, :message => "already in your company !"
end
