class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :isbn, limit: 32

      t.timestamps
    end

    add_index :books, :isbn
  end
end
