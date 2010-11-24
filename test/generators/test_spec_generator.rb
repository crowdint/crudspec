require 'test_helper'

class SpecGeneratorTest < Rails::Generators::TestCase
  tests Crudspec::Generators::SpecGenerator
  destination File.expand_path("../tmp", File.dirname(__FILE__))
  setup :prepare_destination

  test "create the controller files" do
    Crudspec::Generators::SpecGenerator.start('admin/coupons_controller')
    Crudspec::Generators::SpecGenerator.start('admin/discounts')
    Crudspec::Generators::SpecGenerator.start('Admin::Products')
    Crudspec::Generators::SpecGenerator.start('Admin::ClientsController')

    assert_file 'spec/controllers/admin/coupons_controller_spec.rb'
    assert_file 'spec/controllers/admin/discounts_controller_spec.rb'
    assert_file 'spec/controllers/admin/products_controller_spec.rb'
    assert_file 'spec/controllers/admin/clients_controller_spec.rb'
  end
end

