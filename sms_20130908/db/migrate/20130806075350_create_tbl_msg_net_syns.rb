class CreateTblMsgNetSyns < ActiveRecord::Migration
  def change
    create_table :tbl_msg_net_syns do |t|
      t.string :serialNumber
      t.string :phoneNum
      t.string :customerType
      t.string :terminal
      t.string :netMark
      t.string :problemType
      t.string :phenomenon
      t.string :problem
      t.string :addrName
      t.string :expedited
      t.string :expeditedTime
      t.string :sendUser
      t.string :sendUserPhone
      t.string :isReject
      t.string :rejectReason
      t.string :col_userdes
      t.datetime :col_date
      t.string :col_state
      t.integer :col_syn_state
      t.datetime :col_sent_datetime

      t.float :credit
      t.float :flow
      t.string :unittype
      t.string :unitname
      t.string :unitid
      t.string :location
      t.string :duration

      t.timestamps
    end
  end
end
