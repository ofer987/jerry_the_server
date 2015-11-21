require 'rails_helper'

RSpec.describe "commands/index", type: :view do
  before(:each) do
    assign(:commands, [
      Command.create!(
        :name => "Name",
        :data => "MyText"
      ),
      Command.create!(
        :name => "Name",
        :data => "MyText"
      )
    ])
  end

  it "renders a list of commands" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
