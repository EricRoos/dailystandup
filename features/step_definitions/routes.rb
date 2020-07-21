When('the user is on the home page') do
  visit root_path
end

Given('is on the teams page') do
  visit teams_path
end

Given('the user is on the new team page') do
  visit new_team_path
end

