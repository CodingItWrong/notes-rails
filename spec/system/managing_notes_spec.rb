require 'rails_helper'

RSpec.describe 'Viewing Notes', type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'allows editing a note' do
    old_title = 'Note Title'
    old_slug = 'note-title'
    old_body = 'This is the note body.'

    new_title = 'New Title'
    new_slug = 'new-title'
    new_body = 'This is the new body.'

    user = FactoryBot.create(:user)
    note = FactoryBot.create(
      :note,
      user: user,
      title: old_title,
      body: old_body,
    )

    visit "/#{user.display_name}/#{old_slug}"

    click_on 'Edit'

    fill_in 'Title', with: new_title
    fill_in 'Body', with: new_body
    click_on 'Save'

    expect(page).not_to have_content(old_title)
    expect(page).not_to have_content(old_body)

    expect(page).to have_content(new_title)
    expect(page).to have_content(new_body)
  end
end