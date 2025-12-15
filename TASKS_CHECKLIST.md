# Checklist for SimplePractice Tasks Feature

## Exploratory Session Notes:
### Create a Task:
1. Tasks can be created in 2 ways:
    1. Clicking on the '**Create a task**' button
    2. Clicking on the '**Add quick task**' button
    
2.'**Task name**' -> Must be **500 or less characters** -> Only **Mandatory** Field -> Same name can be used several times(**NO UNIQUENESS VALIDATION**) 

    -> Personal comment: I would talk about this with the team, unless there's a very specific use case in which this is needed, It'll be better to validate uniqueness to avoid tasks confusion.
3. **Optional** Fields: 
    1. '**Description**' -> Must be **5000 or less characters**
    2. '**Due on**' -> Shows a calendar to select a date and a time field in format hh:mm:aa -> Final Example: **12/10/2025 2:15 PM**
    3. '**Priority**' -> Shows a **list of fixed priorities** -> *Only 1 can be selected* -> 'None', 'Low', 'Medium', 'High', and 'Critical'
    4. '**Client**' -> Shows a **searchable list** of existent clients -> *Only 1 can be selected*
    5. '**Assigned to**' -> Shows a **searchable list** of ***existent team members*** -> 1 or More can be selected*
    6. '**Attachments**' -> Choose file or drag and drop file
        - Max number of attachments: 20
        - Max upload size: 50MB
    


## Test Checklists:
### Create a Task:
- [x] **Create mandatory only** -> 'Task name' and verify it's shown in the list of tasks correctly  
- [x] **Create with all attributes** -> 'Task name', 'Description', 'Due on', 'Priority', 'Client', 'Assigned to', 'Attachments' and verify it's shown in the list of tasks correctly
- [x] **Create (Multiple Team Members)** for 'Assigned to' several team members simultaneously and verify it's shown in the list of tasks correctly
- [x] Create **with Attachments** and verify it's shown in the list of tasks correctly
- [x] Create **with duplicated name** and verify it's shown in the list of tasks correctly

    **Create a Task - Observation 1**: When entering empty spaces in 'Task name' the validation error 'This field can't be blank' is not shown and the BE returns a '422 Unprocessable Content'.

    Preconditions to reproduce **Create a Task - Observation 1**:
    1. User is in: https://secure.simplepractice.com/tasks?completed=all

    Steps to reproduce **Create a Task - Observation 1**:
    1. Click on 'Create a task'
    2. Type an empty space ' ' in 'Task name'
    3. Click on 'Save' button


    *Create a Task - Expected behavior for Observation 1*:
    - [ ] The validation error 'This field can't be blank' must be shown even when an empty space is inserted in the field.
    
    *Create a Task - Observation 2*: 
    Preconditions to reproduce **Create a Task Observation 2**:
    1. User is in: https://secure.simplepractice.com/tasks?completed=all

    Steps to reproduce **Complete a Task - Observation 2**:
    1. Click on 'Create a task'
    2. Attach 21 files size 782 bytes(total size must meet the Max upload size: 50MB criteria)
    3. Scroll down to find the task at the end


    *Complete a Task - Expected behavior for Observation 2*:
    - [ ] Creation of the task must be blocked till the criteria is met.
     - [ ] OR -> Users should be notified that the task will be created under certain criteria. 


### Complete a Task:
- [x] **Complete an existent task**: Mark as completed and verify
- [x] **Complete a new task**: Mark as completed and verify
    - [ ] Checkbox is shown as checked 
    - [ ] The checked state is persisted
    - [ ] Completed date it's shown correctly (Example: Dec 12)
    
      **Un-checked a completed task**: Mark as incompleted and verify
    - [ ] Checkbox gets un-checked 
    - [ ] The un-checked state persisted correctly

    NOTES: I did noticed **an observation** here. 
    
    *Complete a Task - Obervation 1*: When the tasks are un-checked the tasks in send to the end of the list -> So the user needs to scroll all the way down to find the task.

    Preconditions to reproduce **Complete a Task Observation 1**:
    1. User is in: https://secure.simplepractice.com/tasks?completed=all

    Steps to reproduce **Complete a Task - Observation 1**:
    1. Create a task
    2. Complete the task
    3. Un-check the task -> Notice how the task "disappears from the list"
    4. Scroll down to find the task at the end

    *Complete a Task - Expected behavior for Obervation 1*:
    - [ ] The tasks must be persisted at the top in case the user wants to continue working with it. 



