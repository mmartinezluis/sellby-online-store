class User < ActiveRecord::Base
  validates_presence_of :username, :email  
  validates :password, presence: true, on: :post  
  has_secure_password
  validates :username, uniqueness: true
  has_many :items
  has_one :cart
  
  include Slugifiable::Users
  extend Slugifiable::ClassMethods

  def show_funds
    "$#{self.funds.to_s}"
  end

  def listings
    self.items.where(status: :listing).uniq { |i| i.name }
  end

  def purchases    
    self.items.where(status: :purchased).uniq { |i| i.name }
  end

  def self.all_users_listings
    User.all.collect do |user|
      user.listings
    end.flatten
  end  

  def cart_size
    self.cart.items.length
  end

end