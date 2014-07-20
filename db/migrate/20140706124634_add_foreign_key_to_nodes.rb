class AddForeignKeyToNodes < ActiveRecord::Migration
  def change
    add_reference :nodes, :project, index: true
  end
end
