class CreateUsers < ActiveRecord::Migration
  def change
  	create_able :users do |t|
  		t.string :email
  		t.string :password_digest
  		t.string :name
  		t.text :bio
  		t.binary :header_image
  		t.binary :avatar

  		t.timestamps
  	end
  end
end
