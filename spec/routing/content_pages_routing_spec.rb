require "spec_helper"

describe ContentPagesController do
  describe "routing" do

    it "routes to #index" do
      get("/content_pages").should route_to("content_pages#index")
    end

    it "routes to #new" do
      get("/content_pages/new").should route_to("content_pages#new")
    end

    it "routes to #show" do
      get("/content_pages/1").should route_to("content_pages#show", :id => "1")
    end

    it "routes to #edit" do
      get("/content_pages/1/edit").should route_to("content_pages#edit", :id => "1")
    end

    it "routes to #create" do
      post("/content_pages").should route_to("content_pages#create")
    end

    it "routes to #update" do
      put("/content_pages/1").should route_to("content_pages#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/content_pages/1").should route_to("content_pages#destroy", :id => "1")
    end

  end
end
