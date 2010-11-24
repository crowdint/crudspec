require 'test_helper'
require 'generators/spec_generator'

class SpecGeneratorTest < Rails::Generators::TestCase
  tests ::Crudspec::Generators::SpecGenerator
  destination File.expand_path("../tmp", File.dirname(__FILE__))
  setup :prepare_destination

  test "create the controller files" do
    run_generator 'admin/coupons_controller'
    run_generator 'admin/discounts'
    run_generator 'Admin::Products'
    run_generator 'Admin::ClientsController'

    assert_file 'spec/controllers/admin/coupons_controller_spec.rb'
    assert_file 'spec/controllers/admin/discounts_controller_spec.rb'
    assert_file 'spec/controllers/admin/products_controller_spec.rb'
    assert_file 'spec/controllers/admin/clients_controller_spec.rb'
  end
end

