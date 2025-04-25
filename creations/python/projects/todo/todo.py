from pyfiglet import Figlet
todo = []
def add_task():
    task = input('Add a task to your todo list: ')
    todo.append(task)
    print(f'Task {task} has been added to the todo list')

def show_todos():
    if not todo:
        print('There are no current tasks, please add one')
    else:
        print('-------TASKS-------')
        for index, task in enumerate(todo):
            print(f'Task {index + 1}: {task}')        

def delete_task():
    show_todos()
    try:
        byetask = int(input('Select the number of the task you want to delete'))
        if byetask >= 0 and byetask < len(todo):
            todo.pop(byetask)
            print(f'Task {byetask} has been removed from the todo list')
        else:
            print('Task was not found')
    except:
        print('Invalid input')

def main():
    f = Figlet(font='slant')
    print(f.renderText('TODO APP'))
    print('1. ADD TASK')
    print('2. DELETE TASKS')
    print('3. SHOW TASKS')
    print('4. Exit')

    while True:
        choice = int(input('Select an option from a menu: '))
        if choice == 4:
            print('Thank you for usinf this app')
            break
        if choice == 1:
            add_task()
        elif choice == 2:
            delete_task()
        elif choice == 3:
            show_todos()

if __name__ == '__main__':
    main()