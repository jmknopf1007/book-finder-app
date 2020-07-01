class ChangeReviewTextFromStringToTextInReviews < ActiveRecord::Migration[6.0]
  def change
    change_column :reviews, :text, :text 
  end
end
