# -*- encoding: utf-8 -*-
# stub: backticks 1.0.5 ruby lib

Gem::Specification.new do |s|
  s.name = "backticks".freeze
  s.version = "1.0.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Tony Spataro".freeze]
  s.bindir = "exe".freeze
  s.date = "2023-03-04"
  s.description = "Captures stdout, stderr and (optionally) stdin; uses PTY to avoid buffering.".freeze
  s.email = ["xeger@xeger.net".freeze]
  s.homepage = "https://github.com/xeger/backticks".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new([">= 2.0".freeze, "< 4.0".freeze])
  s.rubygems_version = "3.1.2".freeze
  s.summary = "Intuitive OOP wrapper for command-line processes".freeze

  s.installed_by_version = "3.1.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
  else
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
  end
end
