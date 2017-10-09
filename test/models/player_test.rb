# require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "create a player with a name" do
    Player.create!(name: "bob")
  end

  test "be unable to create two players with the same name" do
    assert_false Player.create(name: "bob").times(2)
  end
end
