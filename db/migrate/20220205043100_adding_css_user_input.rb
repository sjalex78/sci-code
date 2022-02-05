class AddingCssUserInput < ActiveRecord::Migration[7.0]
  def change
    add_column :posters, :css, :text
  end
end
