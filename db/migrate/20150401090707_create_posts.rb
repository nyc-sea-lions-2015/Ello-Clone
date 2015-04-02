class CreatePosts < ActiveRecord::Migration
  def change
  	create_table :posts do |t|
  		t.belongs_to :user, null: false # Good use of AR method here
  		t.string :image, null: false
  		t.string :content, null: true

  		t.timestamps null: false
  	end
  end
end
