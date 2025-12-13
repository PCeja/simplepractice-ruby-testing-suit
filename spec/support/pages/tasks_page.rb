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

  def complete_task(title)
    task_item(title).find('label').click
  end

  def task_completed?(title)
    # Button has the 'is-completed' class task completed
    task_item(title).has_css?('button.is-completed')
  end

  def task_checked?(title)
    # Checked state shows a .checked-circle SVG icon
    task_item(title).has_css?('.checked-circle')
  end

  private

  def task_item(title)
    find('.list-item', text: title)
  end
end