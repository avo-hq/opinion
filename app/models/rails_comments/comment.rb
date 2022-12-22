module RailsComments
  class Comment < ApplicationRecord
    belongs_to :commentator, class_name: "User"
    belongs_to :parent, class_name: "RailsComments::Comment"

    has_many :children, class_name: "RailsComments::Comment"
  end
end
