require 'rails_helper'

RSpec.describe "instructions/edit", type: :view do
  before(:each) do
    @instruction = assign(:instruction, Instruction.create!(
      :game => nil,
      :command => nil
    ))
  end

  it "renders the edit instruction form" do
    render

    assert_select "form[action=?][method=?]", instruction_path(@instruction), "post" do

      assert_select "input#instruction_game_id[name=?]", "instruction[game_id]"

      assert_select "input#instruction_command_id[name=?]", "instruction[command_id]"
    end
  end
end
