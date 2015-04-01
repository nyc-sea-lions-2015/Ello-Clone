class CreatePosts < ActiveRecord::Migration
  def change
  	create_table :posts do |t|
  		t.belongs_to :user, null: false
  		t.binary :picture, null: false
  		t.text :content, null: true

  		t.timestamps, null: false
  	end
  end
end
