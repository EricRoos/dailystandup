Then('I see the {string} form') do |form_name|
	case form_name.downcase
	when "login"
		expect(page).to have_selector("form#new_user")
	end
end
