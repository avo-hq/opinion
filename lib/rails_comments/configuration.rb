module RailsComments
  class Configuration
    include ActiveSupport::Configurable

    config_accessor(:reactions) { ["✌️", "😛", "🚀", "🤷‍♂️", "👀"] }
    config_accessor(:comment_class) { "RailsComments::Comment" }
    config_accessor(:author_class) { "User" }
    config_accessor(:markdown_renderer) do
      RailsComments::MarkdownRenderer.new(
        hard_wrap: true,
        link_attributes: {rel: :nofollow, target: :_blank}
      )
    end
    config_accessor(:markdown_options) do
      {
        autolink: true,
        lax_spacing: true,
        fenced_code_blocks: true
      }
    end
    config_accessor(:current_user) do
      current_user
    end
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield configuration
  end
end
