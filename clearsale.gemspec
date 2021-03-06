# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'clearsale/version'

Gem::Specification.new do |s|
  s.name        = 'clearsale'
  s.version     = Clearsale::VERSION
  s.authors     = ['Daniel Konishi']
  s.email       = %w[dkonishi@gmail.com]
  s.homepage    = 'http://github.com/Baby-com-br/clearsale'
  s.summary     = 'clearsale gem to use Clearsale service'
  s.description = 'clearsale gem to use Clearsale service'

  s.rubyforge_project = 'clearsale'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']
  s.add_dependency 'builder', '~> 3.2'
  s.add_dependency 'multi_json'

  s.add_development_dependency 'vcr'
  s.add_development_dependency 'webmock'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'factory_girl'
  s.add_development_dependency 'byebug'
end
