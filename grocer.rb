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

def apply_coupon_to_cart(matching_item, coupon, cart)
  matching_item[:count] -= coupon[:num]
  item_with_coupon = mk_coupon_hash(coupon)
  item_with_coupon[:clearance] = matching_item[:clearance]
  cart << item_with_coupon
end

def apply_coupons(cart, coupons)
  i = 0
  while i < coupons.count do
    coupon = coupons[i]
    item_with_coupon = find_item_by_name_in_collection(coupon[:item], cart)
    item_is_in_basket = !!item_with_coupon
    count_is_big_enough_to_apply = item_is_in_basket && item_with_coupon[:count] >= coupon[:num]

    if item_is_in_basket and count_is_big_enough_to_apply
      apply_coupon_to_cart(item_with_coupon, coupon, cart)
    end
    i += 1
  end

  cart
end

def apply_clearance(cart)

end

def checkout(cart, coupons)

end
