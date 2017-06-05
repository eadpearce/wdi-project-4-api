class CreateJoinTableFillsTags < ActiveRecord::Migration[5.1]
  def change
    create_join_table :fills, :tags do |t|
      # t.index [:fill_id, :tag_id]
      # t.index [:tag_id, :fill_id]
    end
  end
end
