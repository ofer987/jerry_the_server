require 'rails_helper'

RSpec.describe "instructions/index", type: :view do
  before(:each) do
    assign(:instructions, [
      Instruction.create!(
        :game => nil,
        :command => nil
      ),
      Instruction.create!(
        :game => nil,
        :command => nil
      )
    ])
  end

  it "renders a list of instructions" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
