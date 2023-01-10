module RailsComments::Commentable
  def comments
    comment_class
      .where(commentable_type: self.class.model_name.to_s, commentable_id: id)
      .includes(:author)
  end

  def comment(body, **args)
    comment_class.create!({
      body: body,
      author_type: args[:author_type] || current_user.class || RailsComments.configuration.author_class,
      author_id: args[:author_id] || current_user.id,
      commentable_type: self.class,
      commentable_id: id,
      parent_id: args[:parent_id]
    })
  end

  private

  def comment_class
    RailsComments.configuration
      .comment_class
      .safe_constantize
  end
end
