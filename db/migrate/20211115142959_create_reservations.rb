class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.references :player, null: false, foreign_key: { to_table: :users }, references: :users
      t.string :status
      t.references :game, null: false, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
