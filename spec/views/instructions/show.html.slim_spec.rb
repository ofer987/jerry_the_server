require 'rails_helper'

RSpec.describe "instructions/show", type: :view do
  before(:each) do
    @instruction = assign(:instruction, Instruction.create!(
      :game => nil,
      :command => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
