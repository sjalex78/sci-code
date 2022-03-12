# frozen_string_literal: true

class CreateComponents < ActiveRecord::Migration[7.0]
  def change
    create_table :components, id: :uuid do |t|
      t.references :poster, index: true, type: :uuid, null: false
      t.jsonb :data

      t.timestamps
    end
  end
end
