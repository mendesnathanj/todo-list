# frozen_string_literal: true

class AddTables < ActiveRecord::Migration[5.2]
  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name

      t.timestamps
    end

    create_table :lists do |t|
      t.string :title

      t.timestamps
    end

    create_join_table :users, :lists do |t|
      t.index :user_id
      t.index :list_id
      t.boolean :read_access, default: true, null: false
      t.boolean :write_access, default: true, null: false
      t.boolean :delete_access, default: true, null: false
    end

    create_table :todos do |t|
      t.text :description
      t.boolean :completed, default: false, null: false
      t.references :list

      t.timestamps
    end
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength
end
