# -*- encoding: utf-8 -*-
# stub: vagrant-libvirt 0.12.2 ruby lib

Gem::Specification.new do |s|
  s.name = "vagrant-libvirt".freeze
  s.version = "0.12.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "source_code_uri" => "https://github.com/vagrant-libvirt/vagrant-libvirt" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Lukas Stanek".freeze, "Dima Vasilets".freeze, "Brian Pitts".freeze, "Darragh Bailey".freeze]
  s.date = "2023-06-24"
  s.description = "libvirt provider for Vagrant.".freeze
  s.email = ["ls@elostech.cz".freeze, "pronix.service@gmail.com".freeze, "brian@polibyte.com".freeze, "daragh.bailey@gmail.com".freeze]
  s.executables = ["stackprof-flamegraph.pl".freeze, "stackprof-gprof2dot.py".freeze]
  s.files = ["bin/stackprof-flamegraph.pl".freeze, "bin/stackprof-gprof2dot.py".freeze]
  s.homepage = "https://github.com/vagrant-libvirt/vagrant-libvirt".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.1.2".freeze
  s.summary = "libvirt provider for Vagrant.".freeze

  s.installed_by_version = "3.1.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<fog-libvirt>.freeze, [">= 0.6.0"])
    s.add_runtime_dependency(%q<fog-core>.freeze, ["~> 2"])
    s.add_runtime_dependency(%q<rexml>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<xml-simple>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<diffy>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<nokogiri>.freeze, ["~> 1.6"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    s.add_development_dependency(%q<rspec-core>.freeze, [">= 3.5"])
    s.add_development_dependency(%q<rspec-expectations>.freeze, [">= 3.5"])
    s.add_development_dependency(%q<rspec-mocks>.freeze, [">= 3.5"])
  else
    s.add_dependency(%q<fog-libvirt>.freeze, [">= 0.6.0"])
    s.add_dependency(%q<fog-core>.freeze, ["~> 2"])
    s.add_dependency(%q<rexml>.freeze, [">= 0"])
    s.add_dependency(%q<xml-simple>.freeze, [">= 0"])
    s.add_dependency(%q<diffy>.freeze, [">= 0"])
    s.add_dependency(%q<nokogiri>.freeze, ["~> 1.6"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec-core>.freeze, [">= 3.5"])
    s.add_dependency(%q<rspec-expectations>.freeze, [">= 3.5"])
    s.add_dependency(%q<rspec-mocks>.freeze, [">= 3.5"])
  end
end
