class CreateSchools < ActiveRecord::Migration[6.0]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :location
      t.string :account_id
      t.string :password_digest
      t.string :email

      t.timestamps
    end
  end
end
