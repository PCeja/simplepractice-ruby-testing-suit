class BasePage < SitePrism::Page
  #Common elements(like navigation bar, footer, etc) and methods go here
  element :nav_tasks, ".left-nav a[href='/tasks']"

  def navigate_to_tasks
    nav_tasks.click
  end 
end

  