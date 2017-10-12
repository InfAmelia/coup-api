class CreateChallenges < ActiveRecord::Migration[5.1]
  def change
    create_table :challenges do |t|
      t.string :name
      t.string :hint

      t.timestamps
    end
  end
end
