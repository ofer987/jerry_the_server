require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :serial_number => "Serial Number",
        :email => "Email",
        :active => false
      ),
      User.create!(
        :serial_number => "Serial Number",
        :email => "Email",
        :active => false
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Serial Number".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
