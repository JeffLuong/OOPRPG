class Party
  attr_reader :alive
  attr_accessor :dead

  def initialize
    @alive = []
    @dead = []
  end

  def attack_message(message)
    puts "\n"
    puts message
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
      attack_message("#{@alive[0]}'s turn to attack!")
      choose_monster(opposing_party)
      case get_choice
      when :first
        opposing_party[0].current_hp -= @alive[0].weapon.damage
        if opposing_party[0].current_hp <= 0
          @dead << opposing_party[0]
          opposing_party.delete(opposing_party[0])
          # Pry.start(binding)
        end
        @alive.rotate!
      when :second
        opposing_party[1].current_hp -= @alive[0].weapon.damage
        if opposing_party[1].current_hp <= 0
          @dead << opposing_party[1]
          opposing_party.delete(opposing_party[1])
          # Pry.start(binding)
        end
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
    @gold = 0
    super
  end

end

class MonsterParty < Party
  def attack(opposing_party)
    # randomly choose a member of the opposing_party and attack it
    @alive.length.times do
      random_victim = opposing_party.sample
      attack_message("#{@alive[0]}'s turn to attack!")
      random_victim.current_hp -= @alive[0].weapon.damage
      attack_message("#{random_victim} took damage! His current HP is #{random_victim.current_hp}")
      @alive.rotate!
    end
  end

  def initialize
    super
  end

end
