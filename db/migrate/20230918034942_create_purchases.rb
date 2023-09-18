class CreatePurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :purchases do |t|
      t.integer :status, default: 0
      t.string :first_name
      t.string :last_name
      t.string :email
      t.boolean :customer_paid, default: false
      t.references :tea, null: false, foreign_key: true

      t.timestamps
    end
  end
end
