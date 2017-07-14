require_relative '../models/mini_robot'

describe MiniRobot do

  describe 'instance' do
    subject { MiniRobot.new }
    it { should respond_to(:place).with(3).arguments }
    it { should respond_to :move }
    it { should respond_to :left }
    it { should respond_to :right }
    it { should respond_to :report }
  end
end