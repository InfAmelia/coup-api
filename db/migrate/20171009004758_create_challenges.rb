class CreateChallenge < ActiveRecord::Migration[5.1]
  def change
    create_table :challenges do |t|
      t.references :player, foreign_key: true

      t.timestamps
    end
  end
end
