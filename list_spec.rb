require "rspec"
require 'pry'

require_relative "list"

describe List do

  let(:title) { "Eat more chocolate"}
  let(:list) { List.new(title) }

  before do
    @task = mock(:task)
    @task.stub(:complete!).and_return(true)
  end

  describe "#initialize" do
    it "takes a title for its first argument" do
      expect(List.new("Shopping")).to be_an_instance_of List
    end


    it "requires one argument" do
      expect { List.new }.to raise_error(ArgumentError)
    end

    it "takes an array of tasks" do
      tasks = Array.new(5) { @task }
      expect(List.new("Shopping", tasks)).to be_an_instance_of List
    end
  end

  describe "#title" do
   it "returns the correct title for the list" do
    expect(list.title).to eq(title)
    end
  end

  describe '#add_task' do
   it "should increase number of tasks" do
      list.add_task(@task)
      expect(list.tasks.length).to eq(1)
    end
  end

  describe '#complete_task' do
    it "should call the complete! method on the correct task" do
      list.add_task(@task)
      list.complete_task(0).should eq(true)
    end
  end

  describe '#delete_task' do
    it "should remove the correct task" do
      list.delete_task(0)
      list.tasks.should be_empty
    end
  end

  describe '#completed_tasks' do
    it "should call #complete? on all tasks" do
      list.completed_tasks.should be_a_kind_of(Array)
    end
  end

  describe '#incomplete_tasks' do
    it "should call #complete? on all tasks" do
      list.incomplete_tasks.should be_a_kind_of(Array)
    end
  end

end
