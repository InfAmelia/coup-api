class AddNameToChallenge < ActiveRecord::Migration[5.1]
  def change
    add_column :challenges, :description, :string
  end
end
