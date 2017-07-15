require_relative '../models/mini_robot'

describe MiniRobot do

  describe 'instance methods' do
    subject { MiniRobot.new(print: false) }
    it { should respond_to(:place).with(3).arguments }
    it { should respond_to :move }
    it { should respond_to :left }
    it { should respond_to :right }
    it { should respond_to :report }
  end

  describe 'instance behavior' do
    subject { MiniRobot.new(print: false) }
    before :each do
      subject.place(2, 1, :EAST)
    end

    it 'correct place' do
      expect(subject.report).to eq('2 1 EAST')
    end

    describe 'correct move' do
      it 'EAST' do
        subject.move
        expect(subject.report).to eq('2 0 EAST')
      end
    end

    describe 'correct move over field' do
      it 'EAST' do
        subject.move
        subject.move
        expect(subject.report).to eq('2 0 EAST')
      end
    end

    describe 'correct rotate' do
      it 'LEFT' do
        subject.left
        expect(subject.report).to eq('2 1 SOUTH')
      end
      it 'RIGHT' do
        subject.right
        expect(subject.report).to eq('2 1 NORTH')
      end
      it 'RIGHT twice' do
        subject.right
        subject.right
        expect(subject.report).to eq('2 1 WEST')
      end
    end

    describe 'correct move and rotate' do
      it 'LEFT, MOVE, MOVE' do
        subject.left
        subject.move
        subject.move
        expect(subject.report).to eq('4 1 SOUTH')
      end
      it 'LEFT, MOVE, RIGHT, MOVE, MOVE' do
        subject.left
        subject.move
        subject.right
        subject.move
        subject.move
        expect(subject.report).to eq('3 0 EAST')
      end
    end
  end
end