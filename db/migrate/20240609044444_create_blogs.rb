class CreateBlogs < ActiveRecord::Migration[7.1]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :content
      t.string :tag

      t.timestamps
    end
  end
end
