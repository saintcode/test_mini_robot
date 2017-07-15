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
    before :each do
      subject { MiniRobot.new(print: false) }
      subject.place(2, 1, :EAST)
    end

    it 'correct place' do
      expect(subject.report).to eq('2 1 EAST')
    end

    it 'correct move EAST' do
      subject.move
      puts "SSSSSS=#{subject.report}"
      expect(subject.report).to eq('2 0 EAST')
    end

    it 'correct move over field' do
      subject.move
      subject.move
      expect(subject.report).to eq('2 0 EAST')
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

  describe 'new instance without place' do
    before :each do
      subject { MiniRobot.new(print: false) }
    end

    it 'should ignore report' do
      expect(subject.report).to eq nil
    end
    it 'should ignore move' do
      expect(subject.move).to eq false
    end
    it 'should ignore left' do
      expect(subject.left).to eq false
    end
  end
end
