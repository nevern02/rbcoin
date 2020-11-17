require_relative 'lib/rbcoin/version'

Gem::Specification.new do |spec|
  spec.name          = "rbcoin"
  spec.version       = RbCoin::VERSION
  spec.authors       = ["open_mailbox"]
  spec.email         = ["dev@open-mailbox.com"]

  spec.summary       = "A simple blockchain implementation for educational purposes."
  spec.description   = "A simple blockchain implementation for educational purposes."
  spec.homepage      = "https://github.com/nevern02/rbcoin"
  spec.license       = "MIT"

  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rubocop", "~> 1.3"
end
