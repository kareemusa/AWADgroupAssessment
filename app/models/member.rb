class Member < ActiveRecord::Base
  after_destroy :ensure_an_admin_remains
  
  private
    def ensure_an_admin_remains
      if Member.count.zero?
        raise "Can't delete last user"
      end
    end
    
  validates :name, presence:true, uniqueness:true
  has_secure_password
end
