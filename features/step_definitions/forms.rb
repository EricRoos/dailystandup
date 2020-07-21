Then('the user sees the {string} form') do |form_name|
	case form_name.downcase
	when "login"
		expect(page).to have_selector("form#new_user")
	end
end

Then('the user should see the New Team form') do
  expect(page).to have_selector("form#new_team")
end


When('the user completes the Login form') do
  fill_in "Email", with: @user.email
  fill_in "Password", with: @user.password
end

When('the user completes the New Team form') do
  @team = FactoryBot.build(:team)
  fill_in "Name", with: @team.name
end
