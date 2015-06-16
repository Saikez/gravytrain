class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :name
      t.text :address
      t.string :postcode
      t.text :about_me
      t.string :paypal_email
      t.boolean :accepted_terms

      t.timestamps null: false
    end
  end
end
