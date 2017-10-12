require 'simplecov'
require 'rails_helper.rb'

feature 'Index displays' do
  scenario 'correct created post information' do
    post_one = create(:post, title: "First post", body: "This is post one.")
    post_two = create(:post, title: "Second Post", body: "This is post two.")

    visit '/blog'
    expect(page).to have_content("This is post one.")
    expect(page).to have_content("Second Post")
  end
end
