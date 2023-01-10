require "zeitwerk"
require "rails_comments/version"
require "rails_comments/engine"

loader = Zeitwerk::Loader.for_gem
loader.setup

module RailsComments
  def self.root
    RailsComments::Engine.routes.find_script_name({})
  end
end

loader.eager_load
