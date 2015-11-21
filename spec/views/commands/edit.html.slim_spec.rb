require 'rails_helper'

RSpec.describe "commands/edit", type: :view do
  before(:each) do
    @command = assign(:command, Command.create!(
      :name => "MyString",
      :data => "MyText"
    ))
  end

  it "renders the edit command form" do
    render

    assert_select "form[action=?][method=?]", command_path(@command), "post" do

      assert_select "input#command_name[name=?]", "command[name]"

      assert_select "textarea#command_data[name=?]", "command[data]"
    end
  end
end
