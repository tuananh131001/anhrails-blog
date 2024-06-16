# frozen_string_literal: true

class CreateBlogs < ActiveRecord::Migration[7.1]
  def change
    create_table :blogs do |t|
      t.string :title
      t.json :content
      t.string :tag

      t.timestamps
    end
  end
end
