  describe "GET 'show'" do
    before(:each) do
      # Replace this with your Mock Factory, for ex: Machinist, Fabrication...
      @<%= @model_name %> = <%= @model_name.pluralize %>(:one)
    end

    it 'is successful' do
      get :show, :id => @<%= @model_name %>.id
      response.should be_success
    end

    it "assigns @<%= @model_name %>" do
      get :show, :id => @<%= @model_name %>.id
      assigns(:<%= @model_name %>).should_not be_nil
    end

    it "renders the 'show' template" do
      get :show, :id => @<%= @model_name %>.id
      response.should render_template('show')
    end
  end