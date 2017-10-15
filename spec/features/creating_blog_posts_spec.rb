require 'simplecov'
require 'rails_helper.rb'
require 'selenium-webdriver'

feature 'Creating blog posts' do

  background do
    visit '/blog'
    click_link 'New Post'
  end

  scenario 'can create a blog post.', :js => true do
    fill_in 'post_title', with: 'My first blog post'
    fill_in 'post_body', with: 'This is the body of my first blog post.'
    click_button 'Create Post'
    expect(page).to have_content 'My first blog post'
    expect(page).to have_content 'This is the body of my first blog post.'
    expect(page).to have_content 'Your post has been created.'
  end

  it 'needs a title to create a post.', :js => true do
    click_button 'Create Post'
    expect(page).to have_content 'Your post must include a title!'
  end

end
