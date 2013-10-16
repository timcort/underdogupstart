class CreateAccountItems < ActiveRecord::Migration
  def change
    create_table :account_items do |t|
      t.integer :user_id
      t.integer :product_id

      t.timestamps
    end
  end
end
