class Cart < ActiveRecord::Base
  belongs_to :user
  serialize :items, Array

  def current_quantity(item)
    self.items.select {|i| i.name == item.name && i.user_id == item.user_id}.count
  end

  def handle_item_add(quantity, item)
    quantity.times {
      self.items << item
      self.save
    }
  end

  def handle_item_subtract(quantity, item)
    new_quantity = (-1) * quantity
    new_quantity.times {
      index = self.items.index {|n| n.id == item.id}
      self.items.slice!(index)
      self.save
    }
  end

  def purchase
    # 'handle_funds'--> Debit the buyer and pay the seller(s)
    handle_funds
    # Find the seller items to be purchased and assign those items' user_id to the buyer's user_id
    self.uniq_items.each do |item|                                            
      seller_items = item.all_stock                                       
      quantity_to_buy = self.current_quantity(item)                                    
      quantity_to_buy.times {|i|                                          
        seller_items[i].purchased!
        seller_items[i].user_id = self.user_id
        seller_items[i].save
      }
    end
    # Empty the cart and save it
    self.items.clear
    self.save
  end

  def handle_funds
    amount_charged = self.total
    buyer= self.user
    buyer.funds -= amount_charged
    buyer.save
    pay_sellers
  end

  def pay_sellers
    self.uniq_items.each do |item|
      total_payment = self.current_quantity(item) * item.price
      seller= item.user
      seller.funds += total_payment
      seller.save
    end
  end

  def total
    total = 0
    self.uniq_items.each do |item|
      total += self.current_quantity(item) * item.price
    end
    total
  end

  def uniq_items
    self.items.uniq
  end

  def over_limit_item?
    self.uniq_items.find {|item| current_quantity(item) > item.stock} 
  end

  def out_of_stock_items
    self.uniq_items.select {|item| item.stock == 0 }
  end

  def enough_funds?
    self.user.funds >= self.user.cart.total
  end
  
end

