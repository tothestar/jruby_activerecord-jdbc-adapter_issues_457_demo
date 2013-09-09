class TblMsgNetSyn < ActiveRecord::Base
  attr_accessible :addrName, :col_date, :col_sent_datetime, :col_state, :col_syn_state, :col_userdes, :customerType, :expedited, :expeditedTime, :isReject, :netMark, :phenomenon, :phoneNum, :problem, :problemType, :rejectReason, :sendUser, :sendUserPhone, :serialNumber, :terminal,:credit,:flow,:unittype,:unitname,:unitid,:location,:duration

  paginates_per 5

  validates :phoneNum, :presence => true
  validates :terminal, :presence => true
  validates :problem, :presence => true
  validates :addrName, :presence => true
  validates :location, :presence => true

end
