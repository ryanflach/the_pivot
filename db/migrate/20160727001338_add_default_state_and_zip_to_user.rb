class AddDefaultStateAndZipToUser < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :state, :string, :default => 'ZZ'
    change_column :users, :zip_code, :integer, :default => 99999
  end
end
