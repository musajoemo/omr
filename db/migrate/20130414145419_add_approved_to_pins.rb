class AddApprovedToPins < ActiveRecord::Migration
  def change
    add_column :pins, :approved, :boolean, :default => false
  end
end
