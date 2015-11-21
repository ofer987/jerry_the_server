require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
  end

  describe '#activate with the email udit@gmail.com' do
    let!(:serial_number) { create(:serial_number, name: 'af34') }

    let(:activated_user) do
      User
        .joins(:serial_number)
        .where('serial_numbers.name': serial_number_name)
        .first
    end

    before :each do
      attributes = {
        email: 'udit@gmail.com',
        password: 'foo',
        password_confirmation: 'foo'
      }

      User.activate!(serial_number, attributes)
    end

    context 'activate with serial_number that does exists' do
      let(:serial_number_name) { 'af34' }

      it 'user is created' do
        expect(activated_user).to_not be_nil
      end

      it 'is associated to udit@gmail.com' do
        expect(activated_user.email).to eq('udit@gmail.com')
      end
    end
  end
end
