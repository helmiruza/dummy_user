class CreateUsers < ActiveRecord::Migration
  def change
  	create_table :users do |s|
  		s.string :email
  		s.string :password

  		s.timestamps null:false
  	end
  end
end
