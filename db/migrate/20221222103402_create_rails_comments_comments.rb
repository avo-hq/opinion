class CreateRailsCommentsComments < ActiveRecord::Migration[7.0]
  def change
    create_table :rails_comments_comments do |t|
      t.text :body
      t.json :reactions
      t.references :commentator, null: false, foreign_key: true
      t.references :parent, null: false, foreign_key: true

      t.timestamps
    end
  end
end
