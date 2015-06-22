class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.references :provider

      t.timestamps null: false
    end
  end
end
