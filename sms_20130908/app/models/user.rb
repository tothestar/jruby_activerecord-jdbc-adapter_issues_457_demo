# encoding: utf-8
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, #:registerable,
        # :recoverable, 
        :rememberable, :trackable, :validatable
paginates_per 20
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :branch_id, :department_id, :job_no, :mobile, :name, :note, :position, :role_id

  belongs_to :branch
  belongs_to :department

  validates :mobile, :presence => true,:uniqueness => true

  def self.parseRoleInt(roleId)
    case roleId
    when 1
      return "市管理员"
    when 2
      return "分公司管理员"
    when 3
      return "组管理员"
    when 4
      return "经理"
    when 22
      return "网络工单管理员"
    when 24
      return "网络工单录入员"

    end
  end

  def self.authorizeRole(roleId)
    case roleId
      when 1
      return   [['市管理员', 1], ['分公司管理员', 2], ['组管理员', 3],['经理', 4],['网络工单管理员', 22],['网络工单录入员', 24]] 
      when 2
      return   [ ['组管理员', 3],['经理', 4]]
      when 3
      return   [ ['经理', 4]]
      when 22
      return   [ ['网络工单录入员', 24]]

    end
  end
end
