class AddFieldsToBookmarks < ActiveRecord::Migration
  def change
    add_reference :bookmarks, :user, index: true, foreign_key: true
    add_column :bookmarks, :url, :string
  end
end
