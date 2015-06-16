class Provider < ActiveRecord::Base
  validates_acceptance_of :accepted_terms
end
