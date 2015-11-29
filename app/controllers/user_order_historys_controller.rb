class UserOrderHistorysController < ApplicationController
  def show
		if user_signed_in?		
			@tabs = Tab.where(user_id: current_user.id)
			@info = []			
			@tabs.each do |tab|
				@rest = tab.table.restaurant.name
				@amount = tab.carts.to_a.sum do |cart|
					cart.total_price
				end
				@info << [@rest, @amount]
			end

		end  
	end
end
