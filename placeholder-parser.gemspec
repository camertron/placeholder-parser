# encoding: UTF-8

$:.unshift File.join(File.dirname(__FILE__), 'lib')
require 'placeholder-parser/version'

Gem::Specification.new do |s|
  s.name     = 'placeholder-parser'
  s.version  = ::PlaceholderParser::VERSION
  s.authors  = ['Cameron Dutro']
  s.email    = ['camertron@gmail.com']
  s.homepage = 'http://github.com/camertron'

  s.description = s.summary = 'Identifies common platform-specific placeholder patterns in text.'

  s.platform = Gem::Platform::RUBY
  s.has_rdoc = true

  s.require_path = 'lib'
  s.files = Dir["{lib,spec}/**/*", 'Gemfile', 'History.txt', 'README.md', 'Rakefile', 'placeholder-parser.gemspec']
end
