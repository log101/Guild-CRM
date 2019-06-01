class CompanyContact < ApplicationRecord
  belongs_to :company, :class_name => 'Company'
 	belongs_to :contact_owner, :class_name => 'Company'	

	validates_uniqueness_of :company_id, scope: :contact_owner_id, :message => "already added to contacts"
end
