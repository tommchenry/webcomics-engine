class User < ActiveRecord::Base

  has_secure_password

  def can_publish?
    role == "publisher"
  end

end
