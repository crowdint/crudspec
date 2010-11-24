# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "crudspec/version"

Gem::Specification.new do |s|
  s.name        = "crudspec"
  s.version     = Crudspec::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["David Padilla"]
  s.email       = ["david@crowdint.com"]
  s.homepage    = "http://rubygems.org/gems/crudspec"
  s.summary     = %q{Generate specs for CRUD controllers}
  s.description = %q{Generate specs for CRUD controllers}

  s.add_dependency('rails', '~>3.0.0')
  #s.add_development_dependency("shoulda")

  s.rubyforge_project = "crudspec"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib", "generators"]
end
