require 'test_helper'

class ControllerGeneratorTest < Rails::Generators::TestCase
  destination 'tmp'

  context "with different controller names" do
    setup do
      CrudSpec::ControllerGenerator.start('admin/coupons_controller')
      CrudSpec::ControllerGenerator.start('admin/discounts')
      CrudSpec::ControllerGenerator.start('Admin::Products')
      CrudSpec::ControllerGenerator.start('Admin::ClientsController')
    end

    should "generate the spec files" do
      assert_file 'admin/coupons_controller_spec.rb'
      assert_file 'admin/discounts_controller_spec.rb'
      assert_file 'admin/products_controller_spec.rb'
      assert_file 'admin/clients_controller_spec.rb'
    end
  end
end

