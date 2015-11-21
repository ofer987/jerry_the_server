require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let(:query_parameters) { valid_attributes }
  let(:valid_attributes) do
    {
      email: 'dan@gmail.com',
      password: 'foo'
    }
  end
  let!(:user) { create(:dan, email: 'dan@gmail.com', password: 'foo') }

  describe 'post #create' do
    # let(:user) { Customer.where(username: 'dan').first }
    # let(:user_type) { 'customer' }

    before :each do
    end

    it 'redirects to user#show' do
      post :create, query_parameters

      expect(response).to redirect_to(user)
    end

    it 'has a session' do
      post :create, query_parameters

      expect(session).not_to be_empty
      expect(session[:user_id]).to eq(user.id)
    end

    context 'user is not active' do
      let!(:user) do
        create(:dan, email: 'dan@gmail.com', password: 'foo', active: false)
      end

      it 'redirects to sessions#new' do
        post :create, query_parameters

        expect(response).to redirect_to(action: :new)
      end

      it 'session is empty' do
        post :create, query_parameters

        expect(session).to be_empty
      end
    end

    context 'another user is logged in' do
      let(:another_user) do
        create(:user, email: 'mike@gmail.com', password: 'foo')
      end

      it "redirects to #new" do
        session[:user_id] = another_user.id

        post :create, query_parameters

        expect(response).to redirect_to(action: :new)
        expect(session.to_hash).to include(
          'user_id' => another_user.id
        )
      end
    end
  end

  describe "GET #destroy" do
    before :each do
      post :create, query_parameters
    end

    it "clears the session" do
      delete :destroy, id: user.id

      expect(response).to redirect_to(action: :new)
      expect(session[:user_id]).to be_nil
    end
  end
end
