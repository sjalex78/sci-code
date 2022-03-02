class CreateComponents < ActiveRecord::Migration[7.0]
  def change
    create_table :components, id: :uuid do |t|
      t.jsonb :data

      t.timestamps
    end
  end
end
