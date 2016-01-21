require 'rails_helper'
require 'vcr'
require 'webmock'

feature 'Tweets' do
  before do
    login_as FactoryGirl.create(:user)
    visit root_path
  end

  scenario 'Load tweets' do
    VCR.use_cassette("tweets_vcr") do
      fill_in 'Handle', with: 'BlizzardCS'
      click_button 'Get'

      within 'table' do
        within 'tbody tr:nth-child(1)' do
          expect(page).to have_content '@Ranglo99 Can you post it in our Tech Forum &amp; link it here? https://t.co/eoaTIXlRIN ^DMC'
          expect(page).to have_content '20 Jan 23:28'
        end

        within 'tbody tr:nth-child(3)' do
          expect(page).to have_content "@SinfilledJay Can you double-check the email's header? https://t.co/dm9gQghfPZ ^DMC"
          expect(page).to have_content '20 Jan 23:19'
        end

        within 'tbody tr:nth-child(5)' do
          expect(page).to have_content "@SinfilledJay That looks like a phishing email, as the 'anti-gold' link is not valid. ^DMC"
          expect(page).to have_content '20 Jan 23:07'
        end
      end
    end
  end
end
