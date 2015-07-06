class Party
  attr_reader :alive

  def initialize
    @alive = []
    @dead = []
  end

  def enroll(member)
    @alive << member
  end

  def any?
    @alive.any?
    # should return true if the party has surviving members
  end

  def none?
    !any?
  end

  def cleanup!
    # the_dead = @alive.select { |member| member.is_dead? }
    # @alive = @alive.select! { |member| member.is_alive? }
    # @dead.concat(the_dead)

    the_dead = @alive.select { |member| member.is_dead? }
    @alive -= the_dead
    @dead += the_dead
  end
end

class HeroParty < Party
  attr_reader :gold
  
  def attack(opposing_party)
    # sending message to user, asking which monster to attack
    @alive.length.times do
      choose_monster(opposing_party)
      case get_choice
      when :first
        opposing_party[0].current_hp -= @alive[0].weapon.damage
        @alive.rotate!
      when :second
        opposing_party[1].current_hp -= @alive[0].weapon.damage
        @alive.rotate!
      end
    end
  end

  def choose_monster(opposing_party)
    puts <<-MONSTER_CHOICES

    Choose a monster to attack.
    1. #{opposing_party[0]}
    2. #{opposing_party[1]}

    MONSTER_CHOICES
  end

  def get_choice
    resp = gets.chomp

    if resp == "1"
      return :first
    else
      return :second
    end
  end


  def initialize
    super
  end

end

class MonsterParty < Party
  def attack(opposing_party)
    # randomly choose a member of the opposing_party and attack it
  end

  def initialize
    super
  end

end
