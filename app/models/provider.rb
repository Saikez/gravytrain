require 'securerandom'

class Provider < ActiveRecord::Base
  has_many :events
  accepts_nested_attributes_for :events

  validates_presence_of :name, :address, :about_me
  validates_presence_of :postcode, format: { with: /\A[a-zA-Z0-9]+ [a-zA-Z0-9]+\z/i }
  validates :paypal_email, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z0-9]+\@[a-zA-Z0-9]+\.[a-zA-Z0-9]+\z/i }
  validates_acceptance_of :accepted_terms, allow_nil: false, on: [:create]


  after_create :generate_confirmation_url

  def confirm
    self.confirmed = true
    self.save
  end

  def generate_confirmation_url
    self.token = SecureRandom.urlsafe_base64(16)
    self.save
  end
end
