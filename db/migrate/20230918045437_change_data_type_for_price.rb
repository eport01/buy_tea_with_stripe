class ChangeDataTypeForPrice < ActiveRecord::Migration[7.0]
  def change
    change_column :teas, :price, :integer
  end
end
