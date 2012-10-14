class Dice
  def self.roll(dices, size)
    dices = dices.to_i
    size = size ? size.to_i : 6

    dices.to_i.times.collect { rand 1..size }
  end
end
