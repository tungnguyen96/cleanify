class AddProviderNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :provider_name, :string
  end
end
