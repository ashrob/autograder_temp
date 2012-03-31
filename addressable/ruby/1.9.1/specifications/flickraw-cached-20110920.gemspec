# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "flickraw-cached"
  s.version = "20110920"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ma\u{eb}l Cl\u{e9}rambault"]
  s.date = "2011-09-19"
  s.email = "mael@clerambault.fr"
  s.homepage = "http://hanklords.github.com/flickraw/"
  s.require_paths = ["."]
  s.rubygems_version = "1.8.10"
  s.summary = "Cached version of Flickraw"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<flickraw>, [">= 0.9"])
    else
      s.add_dependency(%q<flickraw>, [">= 0.9"])
    end
  else
    s.add_dependency(%q<flickraw>, [">= 0.9"])
  end
end
