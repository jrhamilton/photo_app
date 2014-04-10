class CreateDatabase < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.column :name, :string
      t.column :user_id, :int
      t.column :slug, :string

      t.timestamps
    end

    create_table :photos do |t|
      t.column :name, :string
      t.column :caption, :string
      t.column :album_id, :int
    end

    create_table :tags do |t|
      t.column :user_id, :int
      t.column :photo_id, :int
    end

  end
end
