class Magic8Ball
  def initialize
    @answer = ["Ask Torey",
               "Ask K-Solo",
               "Use Rails Generate",
               "No",
               "posivibes",
               "Repeat Phase 1",
               "Ask Dave",
               "Killall, ask again",
               "Yes",
               "Ask Deaf Grandma",
               "It's hazy try again",
               "Ask again later",
               "Cant' tell you now",
               "Cannot predict",
               "Ask again",
               "Don't count on it",
               "My reply is no",
               "My sources say no",
               "Outlook not good",
               "Very doubtful"]
  end

  def randomAnswer
    @answer.sample
  end
end
