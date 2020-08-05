class CreateTechniqueOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :technique_options do |t|
      t.string :technique_option_name
      t.references :technique, index: true, foreign_key: true
      t.timestamps
    end
  end
end
