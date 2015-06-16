class RemoveAcceptedTermsFromProviders < ActiveRecord::Migration
  def change
    remove_column :providers, :accepted_terms
  end
end
