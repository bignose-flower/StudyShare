class AddNoticeToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :notice, :boolean, default: false, null: false
  end
end
