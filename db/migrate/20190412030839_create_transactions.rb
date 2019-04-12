class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :amount
      t.boolean :complete
      t.integer :target_id
      t.string :target_type
    end
  end
end
