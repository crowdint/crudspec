module Crudspec
  module Generators
    class SpecGenerator < Rails::Generators::Base
      no_tasks { attr_accessor :controller_actions }
      argument :controller_name, :type => :string, :banner => 'controller_name'
      argument :controller_args, :type => :array, :default => [], :banner => 'controller_actions'
      source_root File.expand_path("../templates", __FILE__)
      desc "Create a RSpec spec for a CRUD controller"
      class_option :devise, :desc => "Include steps to authenticate via devise", :type => :string, :banner => "devise_model", :required => false

      def initialize(*args, &block)
        super

        @controller_actions = []

        controller_args.each do |arg|
          @controller_actions << arg
          @controller_actions << 'create' if arg == 'new'
          @controller_actions << 'update' if arg == 'edit'
        end

        @controller_actions.uniq!

        if @controller_actions.empty?
          @controller_actions = all_actions - @controller_actions
        end
      end

      def generate_spec_file
        underscored = controller_name.underscore
        underscored = underscored + '_controller' unless underscored.match(/_controller$/)
        @class_name = underscored.classify
        @devise = options[:devise] if options[:devise]

        # Really?
        @model_name = @class_name.demodulize.match(/(.+)Controller$/)[1].underscore.singularize
        file_path = "spec/controllers/#{underscored}_spec.rb"

        template('controller_spec.rb', file_path)
      end
      private

      def all_actions
        %w[index show new create edit update destroy]
      end

      def controller_methods(dir_name)
        controller_actions.map do |action|
          read_template("#{dir_name}/#{action}.rb") if all_actions.include?(action)
        end.join("  \n").strip
      end

      def singular_name
        controller_name.underscore
      end

      def plural_name
        controller_name.underscore.pluralize
      end

      def class_name
        controller_name.camelize
      end

      def plural_class_name
        plural_name.camelize
      end

      def read_template(relative_path)
        ERB.new(File.read(find_in_source_paths(relative_path)), nil, '-').result(binding)
      end
    end
  end
end
