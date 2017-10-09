class AddNameToChallenge < ActiveRecord::Migration[5.1]
  def change
    add_column :challenges, :name, :string
  end
end
