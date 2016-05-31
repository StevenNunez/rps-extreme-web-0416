class Judge
  VALID_THROWS = [:rock, :paper, :scissors]

  def judge(player_choice, ai_choice)
    return :fail if invalid?(ai_choice)
    return :fail if invalid?(player_choice)

    player = convert(player_choice)
    ai = convert(ai_choice)

    return :tie if player == ai

    player = convert(player_choice)
    ai = convert(ai_choice)

    if player > ai then :win else :lose end
  end

  def convert(throw)
    map[throw].new
  end

  def map
    VALID_THROWS.zip([Rock, Paper, Scissor]).to_h
  end

  def invalid?(choice)
    !VALID_THROWS.include?(choice)
  end
end

class BaseThrow
  include Comparable # Built into ruby
  def <=>(other)
    return 0 if self.class == other.class
    other.class == chump ? 1 : -1
  end

  def chump
    raise "You must define a chump method in the child class"
  end
end

class Rock < BaseThrow
  def chump
    Scissor
  end
end

class Paper < BaseThrow
  def chump
    Rock
  end
end

class Scissor < BaseThrow
  def chump
    Paper
  end
end
