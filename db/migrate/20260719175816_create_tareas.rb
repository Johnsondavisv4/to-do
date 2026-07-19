class CreateTareas < ActiveRecord::Migration[8.1]
  def change
    create_table :tareas do |t|
      t.string :nombre
      t.boolean :completada, default: false
      t.timestamps
    end
  end
end
