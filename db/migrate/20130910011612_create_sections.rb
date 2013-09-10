class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.integer :product_id
      t.integer :sequence_no
      t.string :title
      t.text :description
      t.text :video
      t.text :notes

      t.timestamps
    end
  end
end
