class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token
      t.string :single_access_token
      t.string :perishable_token
      t.string :role

      t.timestamps
    end
    
    user = User.create!(:email=>"josue87c2@live.com.mx",:name=>"Josue Camara",:password=>"conteo2012",:password_confirmation=>"conteo2012",:role=>"admin")
  end
end