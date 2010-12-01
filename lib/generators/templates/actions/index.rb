  describe "GET 'index'" do
    it "is successful" do
      get :index
      response.should be_success
    end

    it "assigns @<%= @model_name.pluralize %>" do
      get :index
      assigns(:<%= @model_name.pluralize %>).should_not be_nil
    end

    it "renders index template" do
      get :index
      response.should render_template('index')
    end
  end
