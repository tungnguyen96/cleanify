class AddProviderIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :provider_id, :integer
  end
end
