# frozen_string_literal: true

require 'sequel'

Sequel.migration do
  change do
    create_table(:trees) do
      primary_key :id

      String      :eid, unique: true, null: false
      String      :data, unique: true, text:true

      DateTime :created_at
      DateTime :updated_at
    end
  end
end
