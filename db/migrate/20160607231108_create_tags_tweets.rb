class CreateTagsTweets < ActiveRecord::Migration
  def change
    create_table :tags_tweets do |t|
      t.references :tag, index: true, foreign_key: true
      t.references :tweet, index: true, foreign_key: true
    end
  end
end
