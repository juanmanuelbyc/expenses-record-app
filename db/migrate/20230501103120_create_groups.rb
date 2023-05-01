# frozen_string_literal: true

class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :image
      t.references :user, null: false, foreign_key: { to_table: :users }, index: { name: 'groups_users' }

      t.timestamps
    end
  end
end
