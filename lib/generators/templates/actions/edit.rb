  describe "GET 'edit'" do
    before(:each) do
      # Replace this with your Mock Factory, for ex: Machinist, Fabrication...
      @<%= @model_name %> = <%= @model_name.pluralize %>(:one)
    end

    it 'is successful' do
      get :edit, :id => @<%= @model_name %>.id
      response.should be_success
    end

    it "assigns @<%= @model_name %>" do
      get :edit, :id => @<%= @model_name %>.id
      assigns(:<%= @model_name %>).should_not be_nil
    end

    it "renders the 'edit' template" do
      get :edit, :id => @<%= @model_name %>.id
      response.should render_template('edit')
    end
  end