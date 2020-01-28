require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

def welcome_message
  puts "==================================== O_O ===================================="
  puts "====================================     ===================================="
  puts ""
  puts "================================ WELCOME NOOB ================================="
  puts "===================== Tu vas devoir affronter de nombreux ====================="
  puts "==================== ennemis pour pouvoir l'emporter, noob.===================="
  puts "============================== Tu es prêt, noob? =============================="
  print "> "
  gets.chomp
  puts "======================== Ah? Noob n'est pas ton prénom?!========================"
  puts "======================= Quel est ton prénom alors, noob? ======================="
  print "> "
  player_name = gets.chomp
  while player_name.length < 3
    puts "======================== On t'a demandé ton prénom ^^ ========================"
    puts "==================== Mais si tu préfères on peut t'appeler ===================="
    puts "==================================== NOOB ! ==================================="
    puts "====================== Quel est ton prénom alors, noob? ======================="
    print "> "
    player_name = gets.chomp
  end
  puts "=========== Okay, allons y alors, Noo... euh je veux dire #{player_name} ============"
  print "> "
  gets.chomp
  return player_name
end

player_name = welcome_message
my_game = Game.new(player_name)
while my_game.is_still_ongoing? #gamecycle loop
  my_game.show_players
  gets.chomp
  my_game.new_players_in_sight
  gets.chomp
  my_game.menu
  choice = gets.chomp
  my_game.menu_choice(choice)
  gets.chomp
  my_game.enemies_attack
  my_game.turn_end_actions
end
my_game.display_end_game