class User < ActiveRecord::Base
  # Remember to create a migration!
  validates :email, uniqueness: true

  def self.authenticate(email, password)
    @user = User.find_by_email(email)

    return false if @user.nil?
    if @user.password == password
      return @user
    else
      return false
    end
  end

end
