class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :content
      t.string :video_url
      t.string :pic_url
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :tweets, [:user_id, :created_at]
  end
end
