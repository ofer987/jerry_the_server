require 'rails_helper'

RSpec.describe "instructions/new", type: :view do
  before(:each) do
    assign(:instruction, Instruction.new(
      :game => nil,
      :command => nil
    ))
  end

  it "renders new instruction form" do
    render

    assert_select "form[action=?][method=?]", instructions_path, "post" do

      assert_select "input#instruction_game_id[name=?]", "instruction[game_id]"

      assert_select "input#instruction_command_id[name=?]", "instruction[command_id]"
    end
  end
end
