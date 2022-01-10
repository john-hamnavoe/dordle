# frozen_string_literal: true

class GameReflex < ApplicationReflex
  def key_press
    game_id = element.dataset["game-id"].to_i
    key_id = element.dataset["id"].to_i
    game = Game.find(game_id)

    if key_id.between?(1, 26)
      update_guess(game, key_id)
    elsif key_id.zero?
      submit_guess(game)
    elsif key_id == 27
      delete_letter(game)
    end
  end

  private

  def update_guess(game, key_id)
    return if game.guess[game.last_guess]&.length == 5

    letter = find_letter(key_id)
    game.guess[game.last_guess] = "" if game.guess[game.last_guess].nil?
    game.guess[game.last_guess] = "#{game.guess[game.last_guess]}#{letter}"
    game.save
  end

  def submit_guess(game)
    return if game.guess[game.last_guess]&.length != 5

    @wrong_word = 1 unless Word.exists?(word: game.guess[game.last_guess])
    return if @wrong_word == 1

    guess = game.guess[game.last_guess].split("")
    word = game.word.word

    guess.each do |letter|
      game.invalid_letters = "#{game.invalid_letters}#{letter}" if word.index(letter).nil?
    end

    game.winning_guess = game.last_guess + 1 if game.guess[game.last_guess] == game.word.word
    game.last_guess = game.last_guess + 1
    game.save
  end

  def delete_letter(game)
    return if game.guess[game.last_guess].nil?

    game.guess[game.last_guess] = game.guess[game.last_guess][0...-1]
    game.save
  end

  def find_letter(id)
    "ABCDEFGHIJKLMNOPQRSTUVWXYZ"[id - 1]
  end
end
