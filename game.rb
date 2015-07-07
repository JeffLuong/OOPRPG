require 'pry'

require_relative 'hero'
require_relative 'monster'
require_relative 'party'
require_relative 'shop'

class Game
  # attr_reader :HERO_CHOICES
  attr_reader :shop, :hero_choices, :HeroesParty, :MonstersParty

  def initialize
    @HeroesParty = HeroParty.new
    @MonstersParty = MonsterParty.new
    create_shop
    @hero_choices = nil
    @monster_choices = nil
    create_monsters
    create_heroes
    enlist_monsters
    enlist_heroes
    play
  end

  def enlist_monsters
    while @MonstersParty.alive.length < 2
      @MonstersParty.enroll(@monster_choices.sample)
    end
  end

  def enlist_heroes
    while @HeroesParty.alive.length < 2
    # Display choices for heroes
    puts <<-HERO_CHOICES
    Choose your heroes!
    1. artemis
    2. conrad
    3. doug
    HERO_CHOICES
    # Prompt (gets) the user for choices e.g. 2, 6
    choice = gets.chomp
    # Create a party with those heroes in it and return it

      case
      when choice == "1"
        @HeroesParty.enroll(@hero_choices[0])
      when choice == "2"
        @HeroesParty.enroll(@hero_choices[1])
      when choice == "3"
        @HeroesParty.enroll(@hero_choices[2])
      else
        puts "Invalid selection. Choose again."
      end
    end
  end

  def create_heroes
    artemis = Hero.new({
      name: "Artemis",
      hp: 20,
      weapon: Weapon.new({
        name: "longbow",
        damage: 6,
        price: 25
      })
    })

    conrad = Hero.new({
      name: "Conrad",
      hp: 15,
      weapon: Weapon.new({
        name: "dagger",
        damage: 12,
        price: 25
      })
    })

    doug = Hero.new({
      name: "Doug",
      hp: 30,
      weapon: Weapon.new({
        name: "sword",
        damage: 4,
        price: 25
      })
    })

    @hero_choices = [artemis, conrad, doug]
  end

  def create_monsters

    goblin = Monster.new({
      name: "Goblin, father of 7",
      hp: 9,
      weapon: Weapon.new({
        name: "his wife's rusty last kitchen knife",
        damage: 1,
        price: 1
      }),
      xp: 2,
      gold: 1
    })

    troll = Monster.new({
      name: "Troll",
      hp: 35,
      weapon: Weapon.new({
        name: "giant club",
        damage: 40,
        price: 1
        }),
        xp: 10,
        gold: 100
      })

    wolf = Monster.new({
      name: "Wolf",
      hp: 20,
      weapon: Weapon.new({
        name: "teeth",
        damage: 8,
        price: 0
        }),
        xp: 5,
        gold: 15
      })

    orc = Monster.new({
      name: "Orc",
      hp: 25,
      weapon: Weapon.new({
        name: "spear",
        damage: 10,
        price: 5
        }),
        xp: 8,
        gold: 18
      })

      @monster_choices = [goblin, troll, wolf, orc]
  end

  def encounter_message
    puts @MonstersParty.alive[0]
    puts <<-ENCOUNTER_MESSAGE
    You see a #{@MonstersParty.alive[0]} and a #{@MonstersParty.alive[1]} in the distance.
    Do you want to run or fight?
    1. Run!
    2. Fight!
    ENCOUNTER_MESSAGE
  end

  def enter_forest
    encounter_message
    case get_forest_choice
    when :run
      play
    when :fight
      fight
    end
  end

  def get_forest_choice
    resp = gets.chomp

    if resp == "1"
      return :run
    else
      return :fight
    end
  end

  def fight
    # until @HeroesParty.alive.length < 0 && @MonstersParty.alive.length < 0
    @HeroesParty.attack(@MonstersParty.alive)
    @MonstersParty.attack(@HeroesParty.alive)
  # end
  end

  def create_shop
    @shop = Shop.new
  end

  def enter_shop
    @shop.enter(@HeroesParty)
  end

  def town_message
    puts <<-PLAY_MESSAGE
    Your heroes are ready for action,
    should they...
    1. Enter the forest?
    2. Go shopping for wares?
    PLAY_MESSAGE
  end

  def get_location
    resp = gets.chomp

    if resp == "1"
      return :forest
    else
      return :shop
    end
  end

  def play
    while @HeroesParty.any?
      town_message
      case get_location
      when :forest
        enter_forest
      when :shop
        enter_shop
      end
    end
  end

end
# while attackee.is_alive?
#   attacker.attack(attackee)
#
#   puts "#{attacker} attacks #{attackee} with his #{attacker.weapon} for #{attacker.weapon.damage}.  #{attackee} now has #{attackee.current_hp} HP left."
#
#   attacker, attackee = attackee, attacker unless attackee.is_dead?
# end
#
# puts "#{attackee} is now dead..."
game = Game.new


Pry.start(binding)
