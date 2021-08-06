class AddMoreOmniauthFieldsToStudent < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :provider, :string
    add_column :students, :uid, :string
    add_column :students, :image, :string
  end
end
