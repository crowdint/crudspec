  describe "DELETE 'destroy'" do
    before(:each) do
      # Replace this with your Mock Factory, for ex: Machinist, Fabrication...
      @<%= @model_name %> = <%= @model_name.pluralize %>(:one)
      <%= @model_name.classify %>.should_receive(:find).with(@<%= @model_name %>.id).and_return(@<%= @model_name %>)
    end

    it "should delete the <%= @model_name %>" do
      @<%= @model_name %>.should_receive(:delete).and_return(true)
      delete :destroy, :id => @<%= @model_name %>.id
    end

    it "should redirect to index page" do
      delete :destroy, :id => @<%= @model_name %>.id
      response.should redirect_to(:<%= @model_name.pluralize %>)
    end

    it "sets a flash message" do
      delete :destroy, :id => @<%= @model_name %>.id
      flash[:notice].should == '<%= @model_name.classify %> was successfully destroyed.' # Your flash message here
    end
  end