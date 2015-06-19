class AddColumnConfirmedToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :confirmed, :boolean, null: false, default: false
  end
end
