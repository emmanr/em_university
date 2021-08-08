class AddRolesToStudent < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :roles, :jsonb, null: false, default: {}
    add_index  :students, :roles, using: :gin
  end
end
