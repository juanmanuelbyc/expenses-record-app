# frozen_string_literal: true

# top-level documentation comment
class CrateEntities < ActiveRecord::Migration[7.0]
  def change
    create_table :entities do |t|
      t.string :name
      t.integer :amount
      t.references :user, null: false, foreign_key: { to_table: :users }, index: { name: 'entities_users' }
      t.references :group, null: false, foreign_key: { to_table: :groups }, index: { name: 'entities_groups' }

      t.timestamps
    end
  end
end
