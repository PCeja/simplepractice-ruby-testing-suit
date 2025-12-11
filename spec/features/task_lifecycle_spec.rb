require 'spec_helper'
require 'support/pages/login_page'
require 'support/pages/tasks_page'

RSpec.describe 'Tasks' do
    
    let(:login_page) { LoginPage.new }
    let(:tasks_page) { TasksPage.new }

    let(:unique_task_name) { "Task #{Faker::Alphanumeric.alphanumeric(number: 10)}" }

    before do
        login_page.load
        login_page.login(ENV['EMAIL'], ENV['PASSWORD'])
    end

    scenario "User creates a task" do
        tasks_page.load
        tasks_page.create_task(unique_task_name)
        expect(tasks_page.has_task?(unique_task_name)).to be true
    end

end
