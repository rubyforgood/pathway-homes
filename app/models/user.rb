class User < ActiveRecord::Base
  validates_presence_of :role
  has_many :assigned_requests, class_name: "ServiceRequest", inverse_of: :assigned_worker
  has_many :created, class_name: "ServiceRequest", inverse_of: :creator

  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :registerable,
    :validatable
end
