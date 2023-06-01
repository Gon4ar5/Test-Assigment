# frozen_string_literal: true

class CreateExperiments < ActiveRecord::Migration[7.0]
  def change
    create_table :experiments do |t|
      t.text :name
      t.text :value
      t.references :user

      t.timestamps
    end
  end
end
