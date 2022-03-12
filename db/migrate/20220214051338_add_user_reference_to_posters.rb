# frozen_string_literal: true

class AddUserReferenceToPosters < ActiveRecord::Migration[7.0]
  def change
    add_reference :posters, :user, null: false, foreign_key: true, type: :uuid, default: ''
  end
end
