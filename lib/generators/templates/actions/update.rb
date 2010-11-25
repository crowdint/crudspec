  describe "PUT 'update'" do
    before(:each) do
      # Replace this with your Mock Factory, for ex: Machinist, Fabrication...
      @<%= @model_name %> = <%= @model_name.pluralize %>(:one)
    end

    context "the update is successful" do
      before(:each) do
        @<%= @model_name %>.should_receive(:update_attributes).and_return(true)
        <%= @model_name.classify %>.should_receive(:find).with(@<%= @model_name %>.id).and_return(@<%= @model_name %>)
      end

      it "redirects to 'show' action" do
        put :update, :id => @<%= @model_name %>.id, :<%= @model_name %> => {} # Add here some attributes for the model
        response.should redirect_to(<%= @model_name %>_path(@<%= @model_name %>)) # Put the right show path here
      end

      it "sets a flash message" do
        put :update, :id => @<%= @model_name %>.id, :<%= @model_name %> => {} # Add here some attributes for the model
        flash[:notice].should == '<%= @model_name.classify %> was successfully updated.' # Your flash message here
      end
    end

    context "the update fails" do
      before(:each) do
        @<%= @model_name %>.should_receive(:update_attributes).and_return(false)
        <%= @model_name.classify %>.should_receive(:find).with(@<%= @model_name %>.id).and_return(@<%= @model_name %>)
      end

      it "renders the 'edit' action" do
        put :update, :id => @<%= @model_name %>.id, :<%= @model_name %> => {} # Add here some attributes for the model
        response.should render_template(:edit)
      end

      it "assigns @<%= @model_name %>" do
        put :update, :id => @<%= @model_name %>.id, :<%= @model_name %> => {} # Add here some attributes for the model
        assigns(:<%= @model_name %>).should_not be_nil
      end
    end
  end