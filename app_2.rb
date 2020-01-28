require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "-------------------------------------------------"
puts "  |Bienvenue sur 'ILS VEULENT TOUS MA POO' !|    "
puts "|Le but du jeu est d'être le dernier survivant !|"
puts ""
puts ""
puts ""
puts "Quel est ton prénom?"
player_name = gets.chomp
while player_name.length < 3
  puts "Minimum 3 caractère stp!"
  puts "Quel est ton prénom?"
  player_name = gets.chomp
end
player = HumanPlayer.new(player_name)
enemy_0 = Player.new("José")
enemy_1 = Player.new("Josiane")
enemies = [enemy_0, enemy_1]
puts "Des ennemis sont arrivés: #{enemies[0].name} et #{enemies[1].name} !"
gets.chomp
while enemies.all?{|enemy| enemy.life_points <= 0 } == false && player.life_points > 0

  puts "Voici l'état de chaque joueur:"
  player.show_state
  enemies.each{|enemy| enemy.show_state}
  gets.chomp
  puts "Quelle action veux-tu effectuer?"
  puts ""
  puts "a - chercher une meilleure arme"
  puts "s - chercher à te soigner"
  puts ""
  puts "Attaquer un joueur en vue:"
  print "0 - "
  enemies[0].show_state
  print "1 - "
  enemies[1].show_state
  user_input = gets.chomp
  p user_input != "a"
  while (user_input != "a") && (user_input != "A") && (user_input != "s") && (user_input != "S") &&  (user_input != "0") && (user_input != "1")
    puts "Tu dois rentrer soit a, soit s, soit 0, soit 1, c'est pas si compliqué?!"
    puts ""
    puts "Quelle action veux-tu effectuer?"
    puts ""
    puts "a - chercher une meilleure arme"
    puts "s - chercher à te soigner"
    puts ""
    puts "Attaquer un joueur en vue:"
    print "0 - "
    enemies[0].show_state
    print "1 - "
    enemies[1].show_state
    user_input = gets.chomp
  end
  case user_input
    when "a" || "A"
      player.search_weapon
      gets.chomp
    when "s" || "S"
      player.search_health_pack
      gets.chomp
    when "0"
      player.attacks(enemies[0])
      gets.chomp
    when "1"
      player.attacks(enemies[1])
      gets.chomp
    else
      puts "Comment as tu fait pour arriver là petit malin?"
  end
  puts ""
  puts "Les autres joueurs t'attaquent !"
  gets.chomp
  enemies.each{|enemy|
    if enemy.life_points <= 0
      next
    end
    enemy.attacks(player)
    gets.chomp
  }
end

puts "Le combat est terminé! Bye bye!"
gets.chomp

