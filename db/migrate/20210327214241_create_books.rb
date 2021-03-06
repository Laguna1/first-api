class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.integer :pages
      t.integer :read
      t.string :author

      t.timestamps
    end
  end
end
