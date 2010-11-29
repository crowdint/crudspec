require 'test_helper'
require 'generators/spec_generator'

class SpecGeneratorTest < Rails::Generators::TestCase
  tests ::Crudspec::Generators::SpecGenerator
  destination File.expand_path("../../tmp", File.dirname(__FILE__))
  setup :prepare_destination
  teardown :prepare_destination

  test "create the controller files" do
    run_generator %w(admin/coupons_controller)
    run_generator %w(admin/discounts)
    run_generator %w(Admin::Products)
    run_generator %w(Admin::ClientsController)

    assert_file 'spec/controllers/admin/coupons_controller_spec.rb'
    assert_file 'spec/controllers/admin/discounts_controller_spec.rb'
    assert_file 'spec/controllers/admin/products_controller_spec.rb'
    assert_file 'spec/controllers/admin/clients_controller_spec.rb'
  end

  test "devise option" do
    run_generator %w(admin/secrets_controller --devise=user)

    assert_file 'spec/controllers/admin/secrets_controller_spec.rb', /sign_in @user/
    assert_file 'spec/controllers/admin/secrets_controller_spec.rb', /include Devise::TestHelpers/
  end
  
  test "the spec controller should include all the actions" do
    run_generator %w(users)

    assert_file "spec/controllers/users_controller_spec.rb" do |body|
      assert_match "get :index", body
      assert_match "get :show", body
      assert_match "get :new", body
      assert_match "post :create", body
      assert_match "get :edit", body
      assert_match "put :update", body
      assert_match "delete :destroy", body
    end
  end

  test "the spec controller should include only the index action" do
    run_generator %w(users index)

    assert_file "spec/controllers/users_controller_spec.rb" do |body|
      assert_match /get :index/, body
      assert_no_match /get :show/, body
      assert_no_match /get :new/, body
      assert_no_match /post :create/, body
      assert_no_match /get :edit/, body
      assert_no_match /put :update/, body
      assert_no_match /delete :destroy/, body
    end
  end

  test "the spec controller should include only the show action" do
    run_generator %w(users show)

    assert_file "spec/controllers/users_controller_spec.rb" do |body|
      assert_no_match /get :index/, body
      assert_match /get :show/, body
      assert_no_match /get :new/, body
      assert_no_match /post :create/, body
      assert_no_match /get :edit/, body
      assert_no_match /put :update/, body
      assert_no_match /delete :destroy/, body
    end
  end

  test "the spec controller should include only new and create actions" do
    run_generator %w(users new)

    assert_file "spec/controllers/users_controller_spec.rb" do |body|
      assert_no_match /get :index/, body
      assert_no_match /get :show/, body
      assert_match /get :new/, body
      assert_match /post :create/, body
      assert_no_match /get :edit/, body
      assert_no_match /put :update/, body
      assert_no_match /delete :destroy/, body
    end
  end

  test "the spec controller should include only the create action" do
    run_generator %w(users create)

    assert_file "spec/controllers/users_controller_spec.rb" do |body|
      assert_no_match /get :index/, body
      assert_no_match /get :show/, body
      assert_no_match /get :new/, body
      assert_match /post :create/, body
      assert_no_match /get :edit/, body
      assert_no_match /put :update/, body
      assert_no_match /delete :destroy/, body
    end
  end

  test "the spec controller should include only edit and update action" do
    run_generator %w(users edit)

    assert_file "spec/controllers/users_controller_spec.rb" do |body|
      assert_no_match /get :index/, body
      assert_no_match /get :show/, body
      assert_no_match /get :new/, body
      assert_no_match /post :create/, body
      assert_match /get :edit/, body
      assert_match /put :update/, body
      assert_no_match /delete :destroy/, body
    end
  end

  test "the spec controller should include only the update action" do
    run_generator %w(users update)

    assert_file "spec/controllers/users_controller_spec.rb" do |body|
      assert_no_match /get :index/, body
      assert_no_match /get :show/, body
      assert_no_match /get :new/, body
      assert_no_match /post :create/, body
      assert_no_match /get :edit/, body
      assert_match /put :update/, body
      assert_no_match /delete :destroy/, body
    end
  end

  test "the spec controller should include only the destroy action" do
    run_generator %w(users destroy)

    assert_file "spec/controllers/users_controller_spec.rb" do |body|
      assert_no_match /get :index/, body
      assert_no_match /get :show/, body
      assert_no_match /get :new/, body
      assert_no_match /post :create/, body
      assert_no_match /get :edit/, body
      assert_no_match /put :update/, body
      assert_match /delete :destroy/, body
    end
  end

  test "the spec controller should include only index new create actions" do
    run_generator %w(users index new actual)

    assert_file "spec/controllers/users_controller_spec.rb" do |body|
      assert_match /get :index/, body
      assert_no_match /get :show/, body
      assert_match /get :new/, body
      assert_match /post :create/, body
      assert_no_match /get :edit/, body
      assert_no_match /put :update/, body
      assert_no_match /delete :destroy/, body
      assert_no_match /get :actual/, body
    end
  end
end

