require('capybara/rspec')
require('./app.rb')
require('pry')
require('launchy')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
describe('Storing descriptions in words',{:type => :feature}) do
  before() do
    Word.clear
  end

  it('navigates to the "New Word" page and successfully adds a word') do
    visit('/')
    click_on('Create a new word!')
    fill_in('word', :with=>'Test')
    fill_in('def', :with=>'Test definition')
    click_on('Add Word')
    expect(page).to have_content('Test')
  end

  it('Successfully navigates to individual pages for words') do
    visit('/')
    click_on('Create a new word!')
    fill_in('word', :with=>'Test')
    fill_in('def', :with=>'Test definition')
    click_on('Add Word')
    click_on('Test')
    expect(page).to have_content('Test definition')
  end

  it('Can add descriptions to words.') do
    visit('/')
    click_on('Create a new word!')
    fill_in('word', :with=>'Test')
    fill_in('def', :with=>'Test definition')
    click_on('Add Word')
    click_on('Test')
    click_on('Create a new definition!')
    fill_in('def', :with=>'Test definition2')
    click_on('Add Definition')
    expect(page).to have_content('Test definition2')
  end
end
