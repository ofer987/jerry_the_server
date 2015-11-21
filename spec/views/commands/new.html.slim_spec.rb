require 'rails_helper'

RSpec.describe "commands/new", type: :view do
  before(:each) do
    assign(:command, Command.new(
      :name => "MyString",
      :data => "MyText"
    ))
  end

  it "renders new command form" do
    render

    assert_select "form[action=?][method=?]", commands_path, "post" do

      assert_select "input#command_name[name=?]", "command[name]"

      assert_select "textarea#command_data[name=?]", "command[data]"
    end
  end
end
