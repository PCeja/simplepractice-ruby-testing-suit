require 'spec_helper'
require 'support/pages/tasks_page'

RSpec.describe 'Tasks' do
    let(:tasks_page) { TasksPage.new }

    let(:unique_task_name) { "Task #{Faker::Alphanumeric.alphanumeric(number: 10)}" }

    scenario "User creates a task" do
        tasks_page.load
        tasks_page.create_task(unique_task_name)
        expect(tasks_page.has_task?(unique_task_name)).to be true
    end

end
