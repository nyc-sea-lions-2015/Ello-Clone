class CreateUsers < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		t.string :email, null: false, unique: true
  		t.string :password_digest, null: false
  		t.string :user_name, null: false
  		t.text   :bio, null: true
  		t.string :header_image, null: true
  		t.string :avatar, null: true

  		t.timestamps null: false
    end
  end
end
