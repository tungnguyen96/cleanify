class AddCompleteToActivities < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :complete, :boolean
  end
end
