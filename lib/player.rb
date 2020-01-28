class Player
  attr_accessor :name, :life_points
  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
   print "#{@name} a #{@life_points} points de vie.\n"
  end

  def gets_damage(damages)
    @life_points = @life_points - damages
    if @life_points <= 0
      puts "Le joueur #{@name} a été tué !"
    end
  end

  def attacks(target)
    puts "Le joueur #{@name} attaque le joueur #{target.name}."
    dmg = compute_damage
    puts "Le joueur #{@name} a infligé #{dmg} points de dégâts à #{target.name}."
    target.gets_damage(dmg)
  end

  def compute_damage
    rand(1..6)
  end
end

class HumanPlayer < Player
  attr_accessor :weapon_level, :mana
  def initialize(name)
    super(name)
    @life_points = 100
    @weapon_level = 1
    @mana = 10
  end
  def get_mana
    if @mana < 10
      r = rand(1..2)
      if r == 2
        @mana = @mana +1
        puts "#{@name} a récupéré 1 point de mana."
      else
        puts "#{@name} n'a pas récupéré de mana ce tour."
      end
      
    else
      puts "#{@name} a déjà son mana chargé à fond!"
    end
  end
  def launch_fireball_spell(array_of_targets)
    if @mana >= 5
      @mana -= 5
      dmg = rand(1..6)
      puts "#{@name} lance une puissante boule de feu sur ses ennemis et inflige #{dmg} dégâts à chacun d'entre eux!"
      array_of_targets.each{|target| target.gets_damage(dmg)}
    else
      puts "#{@name} puise dans sa magie pour lancer une boule de feu... mais il n'a plus assez de ressources et échoue lamentablement..."
    end
  end
  def show_state
    puts "#{@name} a #{@life_points} points de vie, une arme de niveau #{@weapon_level} et #{@mana} points de mana."
  end

  def compute_damage
    return rand(1..6) * @weapon_level
  end

  def search_weapon
    weapon_level = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{weapon_level}"
    if weapon_level > @weapon_level
      @weapon_level = weapon_level
      puts "Cette nouvelle arme est de meilleure qualité que ton acienne arme. Tu t'en équipes!"
    else
      puts "Cette nouvelle arme n'est pas mieux que ton arme actuelle... Tu la laisses sur le sol."
    end
  end

  def search_health_pack
    result = rand(1..6)
    case result
    when 1
      puts "Tu n'as rien trouvé..."
    when 2..5
      @life_points = @life_points + 50
      if @life_points > 100
        @life_points = 100
      end
      puts "Tu as trouvé un pack de +50 points de vie ! Tes points de vie sont passés à #{@life_points} !"
    when 6
      @life_points = @life_points + 80
      if @life_points > 100
        @life_points = 100
      end
      puts "Tu as trouvé un pack de +80 points de vie ! Tes points de vie sont passés à #{@life_points} !"
    end
  end
end