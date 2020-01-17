#Example
# [
#   {:item => "AVOCADO", :price => 3.00, :clearance => true },
#   {:item => "AVOCADO", :price => 3.00, :clearance => true },
#   {:item => "KALE", :price => 3.00, :clearance => false}
# ]

def find_item_by_name_in_collection(name, collection) #name string, #collection array
  counter = 0 
  while counter < collection.length
    if collection[counter][:item] == name
      return collection[counter]
    end
    counter += 1
  end
end

def consolidate_cart(cart)
 new_cart = []
 counter = 0
 while counter < cart.length
  new_cart_item = find_item_by_name_in_collection(cart[counter][:item],new_cart) # is item in cart
    if new_cart_item != nil 
      new_cart_item[:count] +=1 
    else
      new_cart_item = {
        :item => cart[counter][:item],
        :price => cart[counter][:price],
        :clearance => cart[counter][:clearance],
        :count => 1
      }
      new_cart << new_cart_item
    end
  counter += 1
 end
 new_cart
end


def apply_coupons(cart, coupons)
  counter = 0
  while counter < coupons.length
    cart_item = find_item_by_name_in_collection(coupons[counter][:item], cart) # is item in cart
    couponed_item_name = "#{coupons[counter][:item]} W/ COUPON"
    cart_item_with_coupon = find_item_by_name_in_collection[couponed_item_name, cart]
      if cart_item && cart_item[:count] >= coupons[counter]
      end
  counter += 1
  end
end

def apply_clearance(cart)

end

def checkout(cart, coupons)

end
