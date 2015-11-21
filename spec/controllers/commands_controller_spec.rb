require 'rails_helper'

RSpec.describe CommandsController, type: :controller do
  let(:valid_attributes) do
    {
      name: 'drive',
      data: 123432
    }
  end

  let(:invalid_attributes) do
    {
      name: nil,
      data: nil
    }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CommandsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all commands as @commands" do
      command = Command.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:commands)).to eq([command])
    end
  end

  describe "GET #show" do
    it "assigns the requested command as @command" do
      command = Command.create! valid_attributes
      get :show, {:id => command.to_param}, valid_session
      expect(assigns(:command)).to eq(command)
    end
  end

  describe "GET #new" do
    it "assigns a new command as @command" do
      get :new, {}, valid_session
      expect(assigns(:command)).to be_a_new(Command)
    end
  end

  describe "GET #edit" do
    it "assigns the requested command as @command" do
      command = Command.create! valid_attributes
      get :edit, {:id => command.to_param}, valid_session
      expect(assigns(:command)).to eq(command)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Command" do
        expect {
          post :create, {:command => valid_attributes}, valid_session
        }.to change(Command, :count).by(1)
      end

      it "assigns a newly created command as @command" do
        post :create, {:command => valid_attributes}, valid_session
        expect(assigns(:command)).to be_a(Command)
        expect(assigns(:command)).to be_persisted
      end

      it "redirects to the created command" do
        post :create, {:command => valid_attributes}, valid_session
        expect(response).to redirect_to(Command.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved command as @command" do
        post :create, {:command => invalid_attributes}, valid_session
        expect(assigns(:command)).to be_a_new(Command)
      end

      it "re-renders the 'new' template" do
        post :create, {:command => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) do
        {
          data: 32432854
        }
      end

      it "updates the requested command" do
        command = Command.create! valid_attributes
        put :update, {:id => command.to_param, :command => new_attributes}, valid_session

        command.reload
        expect(command.data).to eq(new_attributes[:data])
      end

      it "assigns the requested command as @command" do
        command = Command.create! valid_attributes
        put :update, {:id => command.to_param, :command => valid_attributes}, valid_session
        expect(assigns(:command)).to eq(command)
      end

      it "redirects to the command" do
        command = Command.create! valid_attributes
        put :update, {:id => command.to_param, :command => valid_attributes}, valid_session
        expect(response).to redirect_to(command)
      end
    end

    context "with invalid params" do
      it "assigns the command as @command" do
        command = Command.create! valid_attributes
        put :update, {:id => command.to_param, :command => invalid_attributes}, valid_session
        expect(assigns(:command)).to eq(command)
      end

      it "re-renders the 'edit' template" do
        command = Command.create! valid_attributes
        put :update, {:id => command.to_param, :command => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested command" do
      command = Command.create! valid_attributes
      expect {
        delete :destroy, {:id => command.to_param}, valid_session
      }.to change(Command, :count).by(-1)
    end

    it "redirects to the commands list" do
      command = Command.create! valid_attributes
      delete :destroy, {:id => command.to_param}, valid_session
      expect(response).to redirect_to(commands_url)
    end
  end

end
