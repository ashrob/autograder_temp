# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "flickraw"
  s.version = "0.9.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mael Clerambault"]
  s.date = "2011-12-04"
  s.email = "maelclerambault@yahoo.fr"
  s.homepage = "http://hanklords.github.com/flickraw/"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.10"
  s.summary = "Flickr library with a syntax close to the syntax described on http://www.flickr.com/services/api"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
