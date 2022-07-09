require "rails_helper"

RSpec.describe EmersonsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/emersons").to route_to("emersons#index")
    end

    it "routes to #new" do
      expect(get: "/emersons/new").to route_to("emersons#new")
    end

    it "routes to #show" do
      expect(get: "/emersons/1").to route_to("emersons#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/emersons/1/edit").to route_to("emersons#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/emersons").to route_to("emersons#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/emersons/1").to route_to("emersons#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/emersons/1").to route_to("emersons#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/emersons/1").to route_to("emersons#destroy", id: "1")
    end
  end
end
