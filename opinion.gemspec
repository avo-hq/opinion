require_relative "lib/opinion/version"

Gem::Specification.new do |spec|
  spec.name        = "opinion"
  spec.version     = Opinion::VERSION
  spec.authors     = ["Adrian Marin"]
  spec.email       = ["adrian@adrianthedev.com"]
  spec.homepage    = "https://avohq.io"
  spec.summary     = "Opinion is a modern comments engine for Ruby on Rails."
  spec.description = "Opinion is a modern comments engine for Ruby on Rails."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/avo-hq/opinion"
  spec.metadata["changelog_uri"] = "https://github.com/avo-hq/opinion"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.0.4"
end
