# -*- encoding: utf-8 -*-
# stub: edamam-ruby 0.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "edamam-ruby".freeze
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "allowed_push_host" => "https://rubygems.org" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Olalekan Eyiowuawi".freeze, "Chris Woodford".freeze, "Mayowa Pitan".freeze]
  s.bindir = "exe".freeze
  s.date = "2017-05-17"
  s.description = "This a ruby wrapper for the Edamam Nutrition api".freeze
  s.email = ["olalekan.eyiowuawi@andela.com".freeze, "chris@gobble.com".freeze, "mayowa.pitan@andela.com".freeze]
  s.homepage = "https://github.com/gobble/edamam-ruby".freeze
  s.rubygems_version = "3.4.17".freeze
  s.summary = "This a ruby wrapper for the Edamam Nutrition api".freeze

  s.installed_by_version = "3.4.17" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_development_dependency(%q<bundler>.freeze, ["~> 1.13"])
  s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
  s.add_development_dependency(%q<pry>.freeze, [">= 0"])
  s.add_development_dependency(%q<webmock>.freeze, [">= 0"])
end
