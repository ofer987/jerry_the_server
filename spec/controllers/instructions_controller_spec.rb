require 'rails_helper'

RSpec.describe InstructionsController, type: :controller do
  let!(:dan) { create(:dan) }
  let!(:game) { create(:game, user: dan) }
  let!(:forward) { create(:drive_forward) }

  let(:parent_route) do
    {
      user_id: dan.to_param,
      game_id: game.to_param
    }
  end
  let(:route) { parent_route }

  let(:valid_attributes) do
    {
      game_id: game.to_param,
      command_id: forward.to_param,
      name: 'Drive Slowly',
      parameters: { power: 10 }
    }
  end

  let(:invalid_attributes) do
    {
      # command does not exist
      command_id: 123432
    }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # InstructionsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    let!(:instruction) do
      create(:instruction, valid_attributes)
    end

    it "assigns all instructions as @instructions" do
      get :index, route, valid_session

      expect(assigns(:instructions)).to eq([instruction])
    end
  end

  describe "GET #show" do
    let(:route) { parent_route.merge(id: instruction.to_param) }

    let!(:instruction) do
      create(:instruction, game: game, command: forward)
    end

    it "assigns the requested instruction as @instruction" do
      get :show, route, valid_session

      expect(assigns(:instruction)).to eq(instruction)
    end
  end

  describe "GET #new" do
    it "assigns a new instruction as @instruction" do
      get :new, route, valid_session

      expect(assigns(:instruction)).to be_a_new(Instruction)
    end
  end

  describe "GET #edit" do
    let(:route) { parent_route.merge(id: instruction.to_param) }

    let!(:instruction) do
      create(:instruction, valid_attributes)
    end

    it "assigns the requested instruction as @instruction" do
      get :edit, route, valid_session

      expect(assigns(:instruction)).to eq(instruction)
    end
  end

  describe "POST #create" do
    let(:query_parameters) do
      {
        instruction: attributes
      }.merge(route)
    end

    context "with valid params" do
      let(:attributes) { valid_attributes }

      it "creates a new Instruction" do
        expect {
          post :create, query_parameters, valid_session
        }.to change(Instruction, :count).by(1)
      end

      it "assigns a newly created instruction as @instruction" do
        post :create, query_parameters, valid_session

        expect(assigns(:instruction)).to be_a(Instruction)
        expect(assigns(:instruction)).to be_persisted
      end

      it "redirects to the created instruction" do
        post :create, query_parameters, valid_session

        expect(response).to redirect_to([dan, game, Instruction.last])
      end
    end

    context "with invalid params" do
      let(:attributes) { invalid_attributes }

      it "assigns a newly created but unsaved instruction as @instruction" do
        post :create, query_parameters, valid_session

        expect(assigns(:instruction)).to be_a_new(Instruction)
      end

      it "re-renders the 'new' template" do
        post :create, query_parameters, valid_session

        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    let!(:instruction) do
      create(:instruction, valid_attributes)
    end

    let(:route) { parent_route.merge(id: instruction.to_param) }
    let(:query_parameters) do
      {
        instruction: new_attributes
      }.merge(route)
    end

    context "with valid params" do
      let(:new_attributes) do
        {
          name: 'Drive Very Slowly'
        }
      end

      it "updates the requested instruction" do
        put :update, query_parameters, valid_session

        instruction.reload
        expect(instruction.name).to eq('Drive Very Slowly')
      end

      it "assigns the requested instruction as @instruction" do
        put :update, query_parameters, valid_session

        expect(assigns(:instruction)).to eq(instruction)
      end

      it "redirects to the instruction" do
        put :update, query_parameters, valid_session

        expect(response).to redirect_to([dan, game, instruction])
      end
    end

    context "with invalid params" do
      let(:new_attributes) do
        {
          name: nil
        }
      end

      it "assigns the instruction as @instruction" do
        put :update, query_parameters, valid_session

        expect(assigns(:instruction)).to eq(instruction)
      end

      it "re-renders the 'edit' template" do
        put :update, query_parameters, valid_session

        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:instruction) do
      create(:instruction, valid_attributes)
    end

    let(:route) { parent_route.merge(id: instruction.to_param) }

    it "destroys the requested instruction" do
      expect {
        delete :destroy, route, valid_session
      }.to change(Instruction, :count).by(-1)
    end

    it "redirects to the instructions list" do
      delete :destroy, route, valid_session

      expect(response)
        .to redirect_to(user_game_instructions_url(dan, game))
    end
  end

end
