require 'rails_helper.rb'

feature 'Creating blog posts' do
  scenario 'can create a blog post' do
    visit '/blog'
    click_link 'New Post'
    fill_in 'Title', with: 'My first blog post'
    fill_in 'Body', with: 'This is the body of my first blog post.'
    click_button 'Create Post'
    expect(page).to have_content 'My first blog post'
    expect(page).to have_content 'This is the body of my first blog post.'
  end
end
