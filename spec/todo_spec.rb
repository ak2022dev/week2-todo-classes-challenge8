require 'todo'

RSpec.describe Todo do
  it "won't allow a task with no description" do
    expect{Todo.new("")}.to raise_error "Cannot enter empty task into list!"
  end
  it "remembers the name of a todo" do
    todo = Todo.new("Wash the car")
    expect(todo.task).to eq "Wash the car"  
  end
  it "knows that initially entered tasks are not done" do
    todo = Todo.new("Wash the car")
    expect(todo.done?).to eq false # => false
  end
  it "remembers tasks that have been marked as done" do
    todo = Todo.new("Wash the car")
    todo.mark_done! 
    expect(todo.done?).to eq true       
  end
end
