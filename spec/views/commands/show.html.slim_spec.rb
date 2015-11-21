require 'rails_helper'

RSpec.describe "commands/show", type: :view do
  before(:each) do
    @command = assign(:command, Command.create!(
      :name => "Name",
      :data => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
  end
end
