# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  password_digest :string
#  created_at      :datetime
#  updated_at      :datetime
#  role            :string           default("user")
#

class User < ActiveRecord::Base

  has_secure_password

  def can_publish?
    role == "publisher"
  end

end
