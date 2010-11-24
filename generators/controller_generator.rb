require 'rails/generators'

module CrudSpec
  class ControllerGenerator < Rails::Generators::Base
    def generate
      puts "Hello World"
    end
  end
end
