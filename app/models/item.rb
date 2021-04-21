class Item < ActiveRecord::Base
  validates_presence_of :name, :price
  belongs_to :user

  include Slugifiable::Items                       #Not used in this project
  extend Slugifiable::ClassMethods                 #Not used in this project

  def stock
    self.user.items.select {|item| item.name == self.name && item.status == "listing" }.count               # Instance method; for a given item, find that item's user, then count the number of items in the user's items array that have the same name as the given item.
  end

  def quantity
    self.user.items.select {|item| item.name == self.name && item.status == "purchased" }.count              # Displays the current user's quantity of a given item that the user has purchased. This method is used in the '/users/show' view.
  end

  def show_price
    self.price.to_s                                  # Changes the scientific notation number returnned by .price into a number with two decimal places within a string.
  end

  def handle_stock(stock)
    if stock.to_i > self.stock
      add_items(stock)
    elsif stock.to_i < self.stock
      subtract_items
    end
  end
 
  def add_items(stock)
    add = stock.to_i - self.stock 
    add.times {
      new_item = Item.new(name: self.name, price: self.price, status: "listing")
      new_item.user = self.user
      new_item.save
    }
  end

  def subtract_items(stock)
    subtract = self.stock - stock.to_i
    subtract.times {
      destroy_item = self.user.items.find_by(name: self.name, status: "listing")
      destroy_item.delete
    }
  end  

end

