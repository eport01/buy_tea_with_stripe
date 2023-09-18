class ChangeFirstNameToName < ActiveRecord::Migration[7.0]
  def change
    rename_column :purchases, :first_name, :name
  end
end
