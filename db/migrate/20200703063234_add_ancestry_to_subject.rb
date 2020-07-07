class AddAncestryToSubject < ActiveRecord::Migration[6.0]
  def change
    add_column :subjects, :ancestry, :string
    add_index :subjects, :ancestry
  end
end
