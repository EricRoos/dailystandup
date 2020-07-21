Then('the user should see {string}') do |string|
  expect(page).to have_content(string)
end

When('the user presses {string}') do |string|
  click_button string
end

