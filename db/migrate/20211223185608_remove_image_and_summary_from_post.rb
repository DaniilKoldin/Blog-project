class RemoveImageAndSummaryFromPost < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :image, :summary
  end
end
