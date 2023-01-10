require "class_variants"

module RailsComments
  module CommentsHelper
    def comments_for(record)
      turbo_frame = dom_id(record, :rails_comments_container)
      url = "#{RailsComments.root}/comments?turbo_frame=#{turbo_frame}&commentable_type=#{record.class.model_name}&commentable_id=#{record.to_param}"

      # render "rails_comments/comments/index", record: record

      turbo_frame_tag turbo_frame, src: url, loading: :lazy do
        "loading..."
      end
    end

    def avatar_url(user)
      md5 = Digest::MD5.hexdigest(user.email.strip.downcase)
      options = {
        size: 48
      }

      query = options.map { |key, value| "#{key}=#{value}" }.join("&")

      URI::HTTPS.build(host: "www.gravatar.com", path: "/avatar/#{md5}", query: query).to_s
    end

    def reaction_classes(**args)
      ClassVariants.build(
        "inline-flex items-center rounded border border-gray-300 bg-white px-2 py-1 text-xs font-medium text-gray-700 shadow-sm hover:bg-gray-200 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2",
        variants: {
          selected: "bg-blue-100 hover:bg-blue-200 border-blue-400",
          "!selected" => "bg-gray-100"
        }
      )
    end

    def rails_comments_assets
      render "rails_comments/comments/assets"
    end
  end
end
