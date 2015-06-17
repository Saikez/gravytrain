class Provider < ActiveRecord::Base
  validates_presence_of :name, :address, :about_me
  validates_presence_of :postcode, format: { with: /\A[a-zA-Z0-9]+ [a-zA-Z0-9]+\z/i }
  validates :paypal_email, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z0-9]+\@[a-zA-Z0-9]+\.[a-zA-Z0-9]+\z/i }
  validates_acceptance_of :accepted_terms
end
