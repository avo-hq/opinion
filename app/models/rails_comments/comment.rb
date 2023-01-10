module RailsComments
  class Comment < ApplicationRecord
    belongs_to :author, polymorphic: true
    belongs_to :commentable, polymorphic: true

    belongs_to :parent, class_name: RailsComments.configuration.comment_class, optional: true
    has_many :children, class_name: RailsComments.configuration.comment_class, foreign_key: "parent_id"
    has_many :reactions, class_name: "RailsComments::Reaction"

    def react(reaction, author_type, author_id)
      has_reaction = reactions.where(emoji: reaction, author_type: author_type.to_s, author_id: author_id).first

      if has_reaction.present?
        # delete it
        has_reaction.destroy!
      else
        reactions.create(emoji: reaction, author_type: author_type, author_id: author_id)
      end
    end

    def descendants
      children | children.map(&:descendants).flatten
    end

    def parsed_body
      markdown = Redcarpet::Markdown.new(RailsComments.configuration.markdown_renderer, **RailsComments.configuration.markdown_options)

      markdown.render(body).html_safe
    end
  end
end
