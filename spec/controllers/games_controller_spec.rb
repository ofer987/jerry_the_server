require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  let!(:dan) { create(:dan) }
  let!(:serial_number) { create(:active_serial_number, user: dan) }

  let(:valid_attributes) do
    {
      name: 'hide and seek'
    }
  end

  let(:invalid_attributes) do
    {
      name: nil
    }
  end

  let(:valid_session) { {} }

  describe "GET #index" do
    let(:game) { create(:game, user: dan) }

    it "assigns all games as @games" do
      get :index, {}, valid_session
      expect(assigns(:games)).to eq([game])
    end
  end

  describe "GET #show" do
    let(:game) { create(:game, user: dan) }

    let(:query_parameters) do
      {
        user_id: dan.id,
        id: game.to_param
      }
    end

    it "assigns the requested game as @game" do
      get :show, query_parameters, valid_session

      expect(assigns(:game)).to eq(game)
    end
  end

  describe "GET #new" do
    let(:query_parameters) do
      {
        user_id: dan.id
      }
    end

    it "assigns a new game as @game" do
      get :new, query_parameters, valid_session
      expect(assigns(:game)).to be_a_new(Game)
    end
  end

  describe "GET #edit" do
    let(:game) { create(:game, user: dan) }
    let(:query_parameters) do
      {
        user_id: dan.id,
        id: game.to_param
      }
    end

    it "assigns the requested game as @game" do
      get :edit, query_parameters, valid_session

      expect(assigns(:game)).to eq(game)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      let(:query_parameters) do
        {
          user_id: dan.id,
          game: valid_attributes
        }
      end

      it "creates a new Game" do
        expect {
          post :create, query_parameters, valid_session
        }.to change(Game, :count).by(1)
      end

      it "assigns a newly created game as @game" do
        post :create, query_parameters, valid_session
        expect(assigns(:game)).to be_a(Game)
        expect(assigns(:game)).to be_persisted
      end

      it "redirects to the created game" do
        post :create, query_parameters, valid_session
        expect(response).to redirect_to(Game.last)
      end
    end

    context "with invalid params" do
      let(:query_parameters) do
        {
          user_id: dan.id,
          game: invalid_attributes
        }
      end

      it "assigns a newly created but unsaved game as @game" do
        post :create, query_parameters, valid_session
        expect(assigns(:game)).to be_a_new(Game)
      end

      it "re-renders the 'new' template" do
        post :create, query_parameters, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    let!(:game) { create(:game, user: dan) }

    context "with valid params" do
      let(:query_parameters) do
        {
          user_id: dan.id,
          id: game.to_param,
          game: valid_attributes
        }
      end

      let(:valid_attributes) do
        {
          name: 'bar'
        }
      end

      it "updates the requested game" do
        put :update, query_parameters, valid_session
        game.reload

        skip("Add assertions for updated state")
      end

      it "assigns the requested game as @game" do
        put :update, query_parameters, valid_session

        expect(assigns(:game)).to eq(game)
      end

      it "redirects to the game" do
        put :update, query_parameters, valid_session

        expect(response).to redirect_to(game)
      end
    end

    context "with invalid params" do
      let(:query_parameters) do
        {
          user_id: dan.id,
          id: game.to_param,
          game: invalid_attributes
        }
      end

      it "assigns the game as @game" do
        put :update, query_parameters, valid_session

        expect(assigns(:game)).to eq(game)
      end

      it "re-renders the 'edit' template" do
        put :update, query_parameters, valid_session

        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:game) { create(:game, user: dan) }
    let(:query_parameters) do
      {
        user_id: dan.id,
        id: game.to_param
      }
    end

    it "destroys the requested game" do
      expect {
        delete :destroy, query_parameters, valid_session
      }.to change(Game, :count).by(-1)
    end

    it "redirects to the games list" do
      delete :destroy, query_parameters, valid_session

      expect(response).to redirect_to(games_url)
    end
  end

end
