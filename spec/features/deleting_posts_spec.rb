require 'simplecov'
require 'rails_helper.rb'

feature 'Deleting a post' do

  scenario 'removes the post from view.' do
    create(:post)

    visit '/blog'
    click_link ( 'This is a title string' )
    click_link ( 'Edit Post' )
    click_link ( 'Delete Post' )
    expect( page.current_path ).to eq( '/blog' )
    expect( page ).to have_content( 'Your post has been deleted.' )
    expect( page ).to_not have_content( 'This is a title string' )
  end

end
