require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :serial_number => "Serial Number",
      :email => "Email",
      :active => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Serial Number/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/false/)
  end
end
