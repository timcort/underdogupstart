module ApplicationHelper

	# Returns the full title on a per-page basis

	def full_title(page_title)
		base_title = "Underdog Upstart"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end

	def price_on_button(price)
		free = "Free"
		if @product.price == 0.0
			free
		else
			"#{price}"
		end
	end
end
