# frozen_string_literal: true

class CreatePosters < ActiveRecord::Migration[7.0]
  def change
    create_table :posters, id: :uuid do |t|
      t.string :title
      t.string :author

      t.timestamps
    end
  end
end
