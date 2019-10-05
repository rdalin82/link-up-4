require 'spec_helper'

# Test game flow
class TestLinkUpFourGame < MiniTest::Test
  def setup
    @game = LinkUpFour::Game.new
  end

  def test_has_a_current_player_which_starts_as_black
    assert_equal @game.current_player, :black
  end

  def test_switch_player_toggles_current_player
    @game.switch_player
    assert_equal @game.current_player, :red
  end
end
