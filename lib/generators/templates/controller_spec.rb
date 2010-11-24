require 'spec_helper'

describe <%= @class_name %> do
  fixtures :<%= @model_name.pluralize %>
<% if @devise %>
  include Devise::TestHelpers

  before(:each) do
    @<%= @devise %> = <%= @devise.pluralize %>(:one) # Replace with whatever mock Factory you're using
    sign_in @<%= @devise %>
  end
<% end %>
  describe "GET 'index'" do
    it "is successful" do
      get :index
      response.should be_success
    end

    it "assigns @<%= @model_name %>" do
      get :index
      assigns(:<%= @model_name.pluralize %>).should_not be_nil
    end

    it "renders index template" do
      get :index
      response.should render_template('index')
    end
  end

  describe "GET 'new'" do
    it 'is successful' do
      get :new
      response.should be_success
    end

    it "assigns @<%= @model_name %>" do
      get :new
      assigns(:<%= @model_name %>).should_not be_nil
    end

    it "renders the 'new' template" do
      get :new
      response.should render_template('new')
    end
  end

  describe "POST 'create'" do
    before(:each) do
      @<%= @model_name %> = <%= @model_name.classify %>.new
      @<%= @model_name %>.stub(:id).and_return(1)
    end

    context "The save is successful" do
      before(:each) do
        <%= @model_name.classify %>.should_receive(:new).and_return(@<%= @model_name %>)
        @<%= @model_name %>.should_receive(:create).and_return(true)
      end

      it "redirects to the 'show' action" do
        post :create, :<%= @model_name %> => @<%= @model_name %>.attributes
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
end
