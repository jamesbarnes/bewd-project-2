class AddForeignKeyToProjects < ActiveRecord::Migration
  def change
    add_reference :projects, :user
  end
end
