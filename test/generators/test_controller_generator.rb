require 'test_helper'

class ControllerGeneratorTest < Test::Unit::TestCase
  def setup
    CrudSpec::ControllerGenerator.start
  end
end

