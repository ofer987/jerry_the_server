require "rails_helper"

RSpec.describe CommandsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/commands").to route_to("commands#index")
    end

    it "routes to #new" do
      expect(:get => "/commands/new").to route_to("commands#new")
    end

    it "routes to #show" do
      expect(:get => "/commands/1").to route_to("commands#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/commands/1/edit").to route_to("commands#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/commands").to route_to("commands#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/commands/1").to route_to("commands#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/commands/1").to route_to("commands#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/commands/1").to route_to("commands#destroy", :id => "1")
    end

  end
end
