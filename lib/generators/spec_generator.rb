module Crudspec
  module Generators
    class SpecGenerator < Rails::Generators::Base
      argument :controller_name, :type => :string, :banner => 'controller_name'
      source_root File.expand_path("../templates", __FILE__)

      def generate_spec_file
        underscored = controller_name.underscore
        underscored = underscored + '_controller' unless underscored.match(/_controller$/)
        @class_name = underscored.classify

        # Really?
        @model_name = @class_name.demodulize.match(/(.+)Controller$/)[1].underscore.singularize
        file_path = "spec/controllers/#{underscored}_spec.rb"

        template('controller_spec.rb', file_path)
      end
    end
  end
end
