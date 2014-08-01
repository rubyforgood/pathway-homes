class User < ActiveRecord::Base
  validates_presence_of :role

  devise :database_authenticatable, :recoverable, :rememberable, :trackable,
    :validatable
end
