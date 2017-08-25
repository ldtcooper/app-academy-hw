class AddUSerEmail < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :email, :string, presence: true
  end
end
