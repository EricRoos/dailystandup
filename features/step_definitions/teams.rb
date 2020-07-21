Then('the user should see the teams name') do
  expect(page).to have_content(@team.name)
end

