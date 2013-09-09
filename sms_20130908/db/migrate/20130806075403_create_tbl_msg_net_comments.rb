class CreateTblMsgNetComments < ActiveRecord::Migration
  def change
    create_table :tbl_msg_net_comments do |t|
      t.integer :serialNumber
      t.string :workNum
      t.datetime :dateTime
      t.string :handlingUser
      t.string :hdUserPhone
      t.string :sName
      t.string :area
      t.string :responses
      t.string :measure
      t.string :isOver

      t.timestamps
    end
  end
end
