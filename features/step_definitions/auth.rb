Given('the user is logged in') do
	visit root_path
	step "the user exists"
	step "the user completes the Login form"
  step 'the user presses "Log in"'
end
