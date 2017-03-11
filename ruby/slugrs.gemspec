# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'slugrs/version'

Gem::Specification.new do |spec|
  spec.name          = 'slugrs'
  spec.version       = Slugrs::VERSION
  spec.authors       = ['Antoine Niek']
  spec.email         = ['antoine.niek@adgear.com']

  spec.summary       = 'Ruby wrapper around slug rust crate'
  spec.description   = 'Ruby wrapper around slug rust crate'
  spec.homepage      = 'https://github.com/Stebalien/slug-rs'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = `git ls-files -z`.split("\x0").reject { |f|
    f.match(%r{^(test|spec|features)/})
  } + Dir['ext/**/*']
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.extensions = Dir['Rakefile']

  spec.add_runtime_dependency('ffi', '1.9.18')
  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'byebug', '~> 9.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
end
