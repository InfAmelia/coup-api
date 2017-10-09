class CreateChallenges < ActiveRecord::Migration[5.1]
  def change
    create_table :challenges do |t|
      t.references :player, foreign_key: true
      t.string :name
      t.timestamps
    end
  end
end
