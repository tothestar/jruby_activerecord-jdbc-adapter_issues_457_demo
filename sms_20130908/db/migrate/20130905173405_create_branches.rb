class CreateBranches < ActiveRecord::Migration
  def change
    create_table :branches do |t|
      t.string :title

      t.timestamps
    end
  end
end
