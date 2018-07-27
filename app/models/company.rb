class Company < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_many :invoices    
    
	validates :company, presence: true

end
