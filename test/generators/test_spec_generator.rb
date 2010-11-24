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
end

