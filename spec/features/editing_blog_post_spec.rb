require 'simplecov'
require 'rails_helper.rb'

feature "Editing a post" do

  background do
    post = create(:post)

    visit '/blog'
    click_link( "This is a title string" )
    click_link( "Edit Post" )
  end

  scenario "can update the body text" do
    fill_in "Body", with: "I need to edit this!"
    click_button( "Update Post" )
    expect(page).to have_content( "Your post has been updated." )
    expect(page).to have_content( "I need to edit this!" )
  end

  scenario 'can update the title text' do
    fill_in "Title", with: "I need to edit this!"
    click_button( "Update Post" )
    expect(page).to have_content( "Your post has been updated." )
    expect(page).to have_content( "I need to edit this!" )
  end

  scenario 'generates an error when the title text is empty' do
    fill_in "Title", with: ""
    click_button( "Update Post" )
    expect(page).to have_content( "There was in error in updating your post. Please try again." )
  end

end
