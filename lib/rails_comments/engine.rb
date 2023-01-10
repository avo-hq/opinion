module RailsComments
  class Engine < ::Rails::Engine
    isolate_namespace RailsComments

    initializer "rails_comments.reloader" do |app|
      RailsComments::Reloader.new.tap do |reloader|
        reloader.execute
        app.reloaders << reloader
        app.reloader.to_run { reloader.execute }
      end
    end

    initializer "rails_comments.helpers" do
      ActiveSupport.on_load :action_controller do
        helper RailsComments::CommentsHelper
      end
    end

    config.app_middleware.use(
      Rack::Static,
      urls: ["/rails_comments_assets"],
      root: RailsComments::Engine.root.join("public")
    )
  end
end
