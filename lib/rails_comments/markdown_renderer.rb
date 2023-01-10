require "redcarpet"
require "rouge"
require "rouge/plugins/redcarpet"

class RailsComments::MarkdownRenderer < Redcarpet::Render::HTML
  include Rouge::Plugins::Redcarpet
end
