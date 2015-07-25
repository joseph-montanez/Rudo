class DeviseTokenAuthCreateUsers < ActiveRecord::Migration
  def change
    change_table(:users) do |t|
      ## Required
      t.string :provider, null: false, default: ""
      t.string :uid, null: false, default: ""

      ## User Info
      t.string :name
      t.string :nickname
      t.string :image

      ## Tokens
      t.text :tokens
    end

    add_index :users, [:uid, :provider],     :unique => true
  end
end
