class Player
  attr_accessor :name, :wins
  def initialize(name)
    @name = name
    @wins = 0
  end
  def win
    @wins += 1
  end
end