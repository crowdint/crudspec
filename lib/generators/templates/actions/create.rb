  describe "POST 'create'" do
    before(:each) do
      @<%= @model_name %> = <%= @model_name.classify %>.new
      @<%= @model_name %>.stub(:id).and_return(1)
    end

    context "The save is successful" do
      before(:each) do
        <%= @model_name.classify %>.should_receive(:new).and_return(@<%= @model_name %>)
        @<%= @model_name %>.should_receive(:save).and_return(true)
      end

      it "redirects to the 'show' action" do
        post :create, :<%= @model_name %> => @<%= @model_name %>.attributes
        response.should redirect_to(<%= @model_name %>_path(@<%= @model_name %>)) # Put the right show path here
      end

      it "sets a flash message" do
        post :create, :<%= @model_name %> => @<%= @model_name %>.attributes
        flash[:notice].should == '<%= @model_name.classify %> was successfully created.'
      end
    end

    context "the save fails" do
      before(:each) do
        @<%= @model_name %>.should_receive(:save).and_return(false)
        <%= @model_name.classify %>.should_receive(:new).and_return(@<%= @model_name %>)
      end

      it "renders the 'new' action" do
        post :create, :<%= @model_name %> => @<%= @model_name %>.attributes
        response.should render_template(:new)
      end

      it "assigns @<%= @model_name %>" do
        post :create, :<%= @model_name %> => @<%= @model_name %>.attributes
        assigns(:<%= @model_name %>).should_not be_nil
      end
    end
  end