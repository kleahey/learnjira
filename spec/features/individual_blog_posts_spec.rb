require 'simplecov'
require 'rails_helper.rb'

feature 'Display individual post' do
  scenario 'by clicking on post title' do
    post_one = create(:post)

    visit '/blog'
    click_link ("#{post_one.title}")
    expect(page).to have_content("#{post_one.title}")
    expect(page).to have_content("#{post_one.body}")
    expect(page.current_path).to eq( post_path( post_one.id ) )
  end
end
