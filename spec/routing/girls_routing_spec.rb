require "spec_helper"

describe GirlsController do
  describe "routing" do

    it "routes to #index" do
      get("/girls").should route_to("girls#index")
    end

    it "routes to #new" do
      get("/girls/new").should route_to("girls#new")
    end

    it "routes to #show" do
      get("/girls/1").should route_to("girls#show", :id => "1")
    end

    it "routes to #edit" do
      get("/girls/1/edit").should route_to("girls#edit", :id => "1")
    end

    it "routes to #create" do
      post("/girls").should route_to("girls#create")
    end

    it "routes to #update" do
      put("/girls/1").should route_to("girls#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/girls/1").should route_to("girls#destroy", :id => "1")
    end

  end
end
