require 'rails/generators'

module CrudSpec
  class ControllerGenerator < Rails::Generators::Base
    argument :controller_name, :type => :string, :banner => 'controller_name'
    source_root File.expand_path("../templates", __FILE__)

    def generate
      underscored = controller_name.underscore
      underscored = underscored + '_controller' unless underscored.match(/_controller$/)
      @class_name = underscored.classify
      destination = File.join("tmp", "#{underscored}_spec.rb")

      template 'controller_spec.rb', destination
    end
  end
end
