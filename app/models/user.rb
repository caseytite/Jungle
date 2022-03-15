class User < ActiveRecord::Base
  has_secure_password


  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: { case_sensitive: false}
  validates :email, presence: true
  validates :password, presence: true, length: { in: 3..30}
  validates :password_confirmation, presence: true, length: { in: 3..30}
  before_save :downcase_fields
  before_save :capitalize_name_fields
  

  def downcase_fields
    self.email.downcase!
  end

  def capitalize_name_fields
    self.first_name.capitalize!
    self.last_name.capitalize!
  end
  



  def self.authenticate_with_credentials(email,password)

    @user = User.find_by_email(email.strip.downcase)
      if(@user && @user.authenticate(password))
        puts 'in function call'
        puts password
        return @user
      end

    # @user = User.find_by_email(email.strip.downcase)
    # if !@user 
    #   return nil
    # elsif 
    #   puts '--------------------------'
    #   puts password
    #   puts '--------------------------'
    #   puts @user.password
    #   puts '--------------------------'
    #   @user.password != password
    #   return nil
    # else
    #   return @user
    # end

    
  end

end
