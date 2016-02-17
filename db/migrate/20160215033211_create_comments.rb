class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :comments
      t.references :user, index: true

      t.timestamps
    end
  end
end
