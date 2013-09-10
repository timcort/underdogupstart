FactoryGirl.define do

	factory :product do
		sequence(:title) { |n| "Product#{n} dealing with difficult people" }
		sequence(:heading) { |n| "Heading#{n}"}
		sequence(:sub_heading) { |n| "Product#{n} Subheading for dealing with difficult people" }
		price 0
		demo_vid '<iframe width="640" height="360" src="//www.youtube.com/embed/eN8nDVGfdZM" frameborder="0" allowfullscreen></iframe>'
		benefits "Lorem ipsum"
	end

	factory :section do
		title "section title"
		sequence_no "1"
		video '<iframe width="640" height="360" src="//www.youtube.com/embed/eN8nDVGfdZM" frameborder="0" allowfullscreen></iframe>'
		notes "Lorem ipsum"
		description "Lorem ipsum"
		product
	end
end