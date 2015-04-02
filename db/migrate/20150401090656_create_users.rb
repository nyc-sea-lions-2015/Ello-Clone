class CreateUsers < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		t.string :email, null: false, unique: true ## Loving the database constraints!!
  		t.string :password_digest, null: false
  		t.string :user_name, null: false
  		t.text   :bio, null: true
  		t.string :header_image, null: true
  		t.string :avatar, null: true, default: 'http://www.afcb.co.uk/images/common/bg_player_profile_default_big.png'

  		t.timestamps null: false
    end
  end
end
