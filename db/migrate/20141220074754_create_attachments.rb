class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.references :task, index: true
      t.references :photo, index: true

      t.timestamps null: false
    end
    add_foreign_key :attachments, :tasks
    add_foreign_key :attachments, :photos
  end
end
