require "spec_helper"

describe MenuListsController do
  describe "routing" do

    it "routes to #index" do
      get("/menu_lists").should route_to("menu_lists#index")
    end

    it "routes to #new" do
      get("/menu_lists/new").should route_to("menu_lists#new")
    end

    it "routes to #show" do
      get("/menu_lists/1").should route_to("menu_lists#show", :id => "1")
    end

    it "routes to #edit" do
      get("/menu_lists/1/edit").should route_to("menu_lists#edit", :id => "1")
    end

    it "routes to #create" do
      post("/menu_lists").should route_to("menu_lists#create")
    end

    it "routes to #update" do
      put("/menu_lists/1").should route_to("menu_lists#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/menu_lists/1").should route_to("menu_lists#destroy", :id => "1")
    end

  end
end
