class AddNameToChallenge < ActiveRecord::Migration[5.1]
  def change
    add_column :name, :description, :string
  end
end
