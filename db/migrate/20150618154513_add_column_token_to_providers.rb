class AddColumnTokenToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :token, :string, unique: true
  end
end
