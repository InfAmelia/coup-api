class CreateChallengeMets < ActiveRecord::Migration[5.1]
  def change
    create_table :challenge_mets do |t|
      t.references :player, foreign_key: true
      t.references :challenge, foreign_key: true

      t.timestamps
    end
  end
end
