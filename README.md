### Run application (example from application folder)
    irb
    require './models/mini_robot.rb'
    robot = MiniRobot.new
    robot.place 2, 2, :EAST
    robot.move
    robot.left
    robot.right
    robor.report

### Install Rspec

    gem install rspec -v 3.6

### Run Rspec tests

    rspec spec/mini_robot_spec.rb