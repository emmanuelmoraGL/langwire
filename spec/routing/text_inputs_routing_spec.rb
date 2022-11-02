require "rails_helper"

RSpec.describe TextInputsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/text_inputs").to route_to("text_inputs#index")
    end

    it "routes to #create" do
      expect(post: "/text_inputs").to route_to("text_inputs#create")
    end

    it "routes to #destroy" do
      expect(delete: "/text_inputs/1").to route_to("text_inputs#destroy", id: "1")
    end
  end
end
