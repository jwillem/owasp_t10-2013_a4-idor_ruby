class AddUsernameAndPublishedToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :author, :string
    add_column :posts, :published, :boolean
  end
end
