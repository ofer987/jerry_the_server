require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :serial_number => "MyString",
      :email => "MyString",
      :active => false
    ))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

      assert_select "input#user_serial_number[name=?]", "user[serial_number]"

      assert_select "input#user_email[name=?]", "user[email]"

      assert_select "input#user_active[name=?]", "user[active]"
    end
  end
end
