require "spec_helper"

describe ServiceMenusController do
  describe "routing" do

    it "routes to #index" do
      get("/service_menus").should route_to("service_menus#index")
    end

    it "routes to #new" do
      get("/service_menus/new").should route_to("service_menus#new")
    end

    it "routes to #show" do
      get("/service_menus/1").should route_to("service_menus#show", :id => "1")
    end

    it "routes to #edit" do
      get("/service_menus/1/edit").should route_to("service_menus#edit", :id => "1")
    end

    it "routes to #create" do
      post("/service_menus").should route_to("service_menus#create")
    end

    it "routes to #update" do
      put("/service_menus/1").should route_to("service_menus#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/service_menus/1").should route_to("service_menus#destroy", :id => "1")
    end

  end
end
