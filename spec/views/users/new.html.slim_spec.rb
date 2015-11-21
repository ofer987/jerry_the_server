require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      :serial_number => "MyString",
      :email => "MyString",
      :active => false
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input#user_serial_number[name=?]", "user[serial_number]"

      assert_select "input#user_email[name=?]", "user[email]"

      assert_select "input#user_active[name=?]", "user[active]"
    end
  end
end
