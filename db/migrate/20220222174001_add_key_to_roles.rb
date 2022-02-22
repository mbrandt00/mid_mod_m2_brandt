class AddKeyToRoles < ActiveRecord::Migration[5.2]
  def change
    add_reference :roles, :actor, foreign_key: true
    add_reference :roles, :movie, foreign_key: true
  end
end
