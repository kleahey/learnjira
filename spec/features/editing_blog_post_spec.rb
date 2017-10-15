require 'simplecov'
require 'rails_helper.rb'

feature "Editing a post" do

  background do
    post = create(:post)

    visit '/blog'
    click_link( "#{post.title}" )
    click_link( "Edit Post" )
  end

  scenario "can update the body text", :js => true do
    fill_in "post_body", with: "I need to edit this!"
    click_button( "Update Post" )
    expect(page).to have_content( "Your post has been updated." )
    expect(page).to have_content( "I need to edit this!" )
  end

  scenario 'can update the title text', :js => true do
    fill_in "post_title", with: "I need to edit this!"
    click_button( "Update Post" )
    expect(page).to have_content( "Your post has been updated." )
    expect(page).to have_content( "I need to edit this!" )
  end

  scenario 'generates an error when the title text is empty', :js => true do
    fill_in "post_title", with: ""
    click_button( "Update Post" )
    expect(page).to have_content( "There was in error in updating your post. Please try again." )
  end

end
