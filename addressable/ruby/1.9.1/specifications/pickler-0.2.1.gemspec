# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "pickler"
  s.version = "0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tim Pope"]
  s.date = "2011-08-26"
  s.description = "Synchronize between Cucumber and Pivotal Tracker"
  s.email = "ruby@tpope.org"
  s.executables = ["pickler"]
  s.files = ["bin/pickler"]
  s.homepage = "http://github.com/tpope/pickler"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.10"
  s.summary = "PIvotal traCKer Liaison to cucumbER"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<crack>, [">= 0.1.8"])
      s.add_development_dependency(%q<rake>, ["~> 0.9.2"])
      s.add_development_dependency(%q<rspec>, ["~> 2.0.0"])
      s.add_development_dependency(%q<fakeweb>, ["~> 1.3.0"])
    else
      s.add_dependency(%q<crack>, [">= 0.1.8"])
      s.add_dependency(%q<rake>, ["~> 0.9.2"])
      s.add_dependency(%q<rspec>, ["~> 2.0.0"])
      s.add_dependency(%q<fakeweb>, ["~> 1.3.0"])
    end
  else
    s.add_dependency(%q<crack>, [">= 0.1.8"])
    s.add_dependency(%q<rake>, ["~> 0.9.2"])
    s.add_dependency(%q<rspec>, ["~> 2.0.0"])
    s.add_dependency(%q<fakeweb>, ["~> 1.3.0"])
  end
end
