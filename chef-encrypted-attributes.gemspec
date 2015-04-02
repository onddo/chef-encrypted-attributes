# encoding: UTF-8
# -*- mode: ruby -*-
# vi: set ft=ruby :

# More info at http://guides.rubygems.org/specification-reference/

$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'chef/encrypted_attribute/version'
chef_version =
  if ENV.key?('CHEF_VERSION')
    ENV['CHEF_VERSION']
  else
    ['>= 11.4', '< 13']
  end

Gem::Specification.new do |s|
  s.name = 'chef-encrypted-attributes'
  s.version = ::Chef::EncryptedAttribute::VERSION
  s.date = '2014-12-10'
  s.platform = Gem::Platform::RUBY
  s.summary = 'Chef Encrypted Attributes'
  s.description =
    'Chef plugin to add Node encrypted attributes support using client keys'
  s.license = 'Apache-2.0'
  s.authors = ['Onddo Labs, SL.']
  s.email = 'team@onddo.com'
  s.homepage = 'http://onddo.github.io/chef-encrypted-attributes'
  s.require_path = 'lib'
  s.files = %w(
    .yardopts Rakefile LICENSE
  ) + Dir.glob('*.md') + Dir.glob('lib/**/*')
  s.test_files = Dir.glob('{test,spec,features}/*')
  s.required_ruby_version = Gem::Requirement.new('>= 1.9.2')

  s.add_dependency 'ffi-yajl', '~> 1.0'
  s.add_dependency 'chef', chef_version
  s.add_dependency 'mixlib-shellout', '< 1.6.1' if RUBY_VERSION < '1.9.3'
  s.add_dependency 'ohai', '< 8' if RUBY_VERSION < '2'

  s.add_development_dependency 'rake', '~> 10.0'
  s.add_development_dependency 'chef-zero', '~> 3.2'
  s.add_development_dependency 'rspec-core', '~> 3.1'
  s.add_development_dependency 'rspec-expectations', '~> 3.1'
  s.add_development_dependency 'rspec-mocks', '~> 3.1'
  s.add_development_dependency 'coveralls', '~> 0.7'
  s.add_development_dependency 'simplecov', '~> 0.9'
  s.add_development_dependency 'should_not', '~> 1.1'
  s.add_development_dependency 'rubocop', '= 0.27.1' if RUBY_VERSION >= '1.9.3'

  s.cert_chain = [::File.join('certs', 'team_onddo.crt')]
end
