Then('I see {string}') do |string|
  expect(page).to have_content(string)
end
