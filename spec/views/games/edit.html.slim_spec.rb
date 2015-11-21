require 'rails_helper'

RSpec.describe "games/edit", type: :view do
  before(:each) do
    @game = assign(:game, Game.create!(
      :user => nil,
      :name => "MyString"
    ))
  end

  it "renders the edit game form" do
    render

    assert_select "form[action=?][method=?]", game_path(@game), "post" do

      assert_select "input#game_user_id[name=?]", "game[user_id]"

      assert_select "input#game_name[name=?]", "game[name]"
    end
  end
end
