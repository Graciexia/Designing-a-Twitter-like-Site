class User < ActiveRecord::Base
  # has_secure_password
  has_many :tweets

  def self.select_users
    all.map { |user| [user.email, user.id] }
  end
end
