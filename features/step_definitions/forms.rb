Then('the user sees the {string} form') do |form_name|
	case form_name.downcase
	when "login"
		expect(page).to have_selector("form#new_user")
	end
end

When('the user completes the Login Form') do
  fill_in "Email", with: @user.email
  fill_in "Password", with: @user.password
end

