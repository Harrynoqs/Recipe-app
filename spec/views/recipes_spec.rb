require_relative '../rails_helper'

RSpec.describe 'The recipes index page', type: :feature do
  describe 'after logging in' do
    before :each do
      @user1 = User.create!(name: 'Harry', email: 'harry@gmail.com', password: 'noqs123', confirmed_at: Time.now)

      @recipe1 = Recipe.create!(name: 'pizza', description: 'pizza is an italian food', public: true,
                                preparation_time: 1, cooking_time: 2, user_id: @user1.id)

      #   @recipe2 = Recipe.create!(name: 'Apple Pie', description: 'Apple pie is apple pie', public: false,
      #                             preparation_time: 1, cooking_time: 2, user_id: @user1.id)

      visit 'users/sign_in'
      fill_in 'Email', with: 'harry@gmail.com'
      fill_in 'Password', with: 'noqs123'
      click_on 'Log in'
    end

    it 'shows the title, description, preparation and cooking time' do
      visit '/recipes'
      expect(page).to have_content 'pizza'

      expect(page).to have_content 'pizza is an italian food'
    end
  end
end
