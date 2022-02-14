# frozen_string_literal: true

class CreateContributorsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :contributors, id: :uuid do |t|
      t.references :user, type: :uuid
      t.references :poster, type: :uuid
      t.integer :role, null: false, default: 0
      t.timestamps null: false
    end
  end
end
