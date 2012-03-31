# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "acts_as_tree_rails3"
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["David Heinemeier Hansson", "and others"]
  s.date = "2010-06-18"
  s.description = "Model gets: root, siblings, ancestors, descendants and other methods for tree navigation"
  s.email = "jim@saturnflyer.com"
  s.extra_rdoc_files = ["LICENSE", "README.markdown"]
  s.files = ["LICENSE", "README.markdown"]
  s.homepage = "http://github.com/saturnflyer/acts_as_tree"
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.10"
  s.summary = "Make your model act as a tree structure"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
