require 'spec_helper'

describe <%= @class_name %>
  describe "GET 'index'" do
    it "is succesful" do
      get :index
      response.should be_success
    end
  end
end
