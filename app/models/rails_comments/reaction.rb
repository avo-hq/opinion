module RailsComments
  class Reaction < ApplicationRecord
    belongs_to :comment
    belongs_to :author, polymorphic: true
  end
end
