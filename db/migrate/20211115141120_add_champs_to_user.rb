class AddChampsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :pseudo, :string
    add_column :users, :description, :text
    add_column :users, :phone_number, :string
    add_column :users, :avatar, :string
    add_column :users, :address, :string
  end
end
