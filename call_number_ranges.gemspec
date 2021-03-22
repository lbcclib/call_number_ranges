# frozen_string_literal: true

require_relative 'lib/call_number_ranges/version'

Gem::Specification.new do |spec|
  spec.name          = 'call_number_ranges'
  spec.version       = CallNumberRanges::VERSION
  spec.authors       = ['Jane Sandberg']
  spec.email         = ['sandbej@linnbenton.edu']

  spec.summary       = 'Some mappings of Library of Congress call numbers to academic departments'
  spec.description   = <<-END_DESCRIPTION
  Some mappings of Library of Congress call numbers to academic departments.
  Very opinionated and specific to our specific context.  See also the
  high_level_browse gem.
  END_DESCRIPTION
  spec.homepage      = 'https://github.com/lbcclib/call_number_ranges'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.4.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/lbcclib/call_number_ranges'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'rspec', '~> 3.10'
  spec.add_development_dependency 'rubocop', '~> 1.11'
end
