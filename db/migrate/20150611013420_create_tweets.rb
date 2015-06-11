class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :messages

      t.timestamps null: false
    end
  end
end
