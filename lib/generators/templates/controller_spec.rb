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
  <%= controller_methods :actions %>
end
