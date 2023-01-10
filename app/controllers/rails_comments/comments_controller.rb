module RailsComments
  class CommentsController < ApplicationController
    before_action :set_commentable
    before_action :set_comment, only: [:react, :destroy]

    def index
      # @record_name = params[:record_name]
      # @record_class = @record_name.singularize.classify.safe_constantize
      @record = @commentable
      @comment = comment_class.new
    end

    def create
      puts ["comment_params->", comment_params].inspect
      @comment = comment_class.create! comment_params
      @record = @comment.commentable
      if comment_params[:parent_id].present?
        @parent = comment_class.find comment_params[:parent_id]
      end
    end

    def new
      @comment = comment_class.new
      @parent = comment_class.find params[:parent_id]
      @record = @parent.commentable
    end

    def destroy
      @comment.destroy!

      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.remove(@comment) }
      end
    end

    def react
      @comment.react(params[:reaction], current_user&.class, current_user&.id)
    end

    private

    def comment_params
      params.require(:comment).permit(:body, :author_type, :author_id, :commentable_type, :commentable_id, :parent_id)
    end

    def set_comment
      @comment = comment_class.find params[:id]
    end

    def set_commentable
      klass = params[:commentable_type]
      id = params[:commentable_id]

      if klass && id
        @commentable = klass.safe_constantize.find id
      end
    end

    def comment_class
      RailsComments.configuration.comment_class.safe_constantize
    end
  end
end
