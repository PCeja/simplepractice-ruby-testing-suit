require_relative 'base_page'

class TasksPage < BasePage
  set_url '/tasks'


  # --- Selectors ---
  element :add_task_button,  "a[href='/tasks/new']"

  element :task_name_field, "input[name='title']"
  element :task_save_button, "button.primary", text: "Save"

  # --- Actions ---
  def create_task(title)
    add_task_button.click

    task_name_field.set(title)
    task_save_button.click
  end

  def has_task?(title)
    page.has_content?(title)
  end
end