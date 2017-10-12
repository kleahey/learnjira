require 'simplecov'
require 'rails_helper.rb'

feature 'Display individual post' do
  scenario 'by clicking on post title' do
    post_one = create(:post)

    visit '/blog'
    click_link ("This is a title string")
    expect(page).to have_content("This is a title string")
    expect(page).to have_content("This is body text.")
    expect(page.current_path).to eq( post_path( post_one.id ) )
  end
end
