class RemoveLastNameInPurchases < ActiveRecord::Migration[7.0]
  def change
    remove_column :purchases, :last_name
  end
end
