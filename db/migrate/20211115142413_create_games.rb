class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :name
      t.string :category
      t.string :number_of_players
      t.text :description
      t.references :owner, null: false, foreign_key: { to_table: :users }, references: :users
      t.integer :price

      t.timestamps
    end
  end
end
