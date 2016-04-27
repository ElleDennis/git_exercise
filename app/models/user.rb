class User < ActiveRecord::Base
  has_secure_password
  has_many :grams
  has_one :subscription, :dependent => :destroy
  validates_presence_of   :first_name, :last_name, :email
  validates_format_of     :email, with: /@/
  validates_uniqueness_of :email, case_sensitive: false

  before_save { self.email = email.downcase }
end
