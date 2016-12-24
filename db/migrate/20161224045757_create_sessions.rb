class CreateSessions < ActiveRecord::Migration[5.0]
  def change
    create_table :sessions do |t|
      t.references :user, foreign_key: true
      t.string :auth_token
      t.datetime :expiry_date

      t.timestamps
    end
  end
end
