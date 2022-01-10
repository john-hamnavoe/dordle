class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.references :word, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :guess, array: true, default: []
      # t.string :guess1
      # t.string :guess2
      # t.string :guess3
      # t.string :guess4
      # t.string :guess5
      # t.string :guess6
      t.string :invalid_letters, default: ""
      t.integer :winning_guess
      t.integer :last_guess, default: 0

      t.timestamps
    end
  end
end
