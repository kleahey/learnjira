require 'rails_helper.rb'

feature 'Creating blog posts' do
  scenario 'can create a blog post.' do
    visit '/blog'
    click_link 'New Post'
    fill_in 'Title', with: 'My first blog post'
    fill_in 'Body', with: 'This is the body of my first blog post.'
    click_button 'Create Post'
    expect(page).to have_content 'My first blog post'
    expect(page).to have_content 'This is the body of my first blog post.'
    expect(page).to have_content 'Your post has been created.'
  end

  it 'needs a title to create a post.' do
    visit '/blog'
    click_link 'New Post'
    click_button 'Create Post'
    expect(page).to have_content 'Your post must include a title!'
  end
end
