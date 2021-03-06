# frozen_string_literal: true

module Frontend
  module WordHelper
    def display_letter(letter_index, word, guess, row_index, guess_index)
      bg_class = ""
      text_class = ""
      letter = ""
      if row_index <= guess_index
        letter = guess[letter_index]
        bg_class =   if word[letter_index] == guess[letter_index]
                       "bg-green-500"
                     elsif word.index(guess[letter_index]).present?
                       set_amber_color(letter_index, word, guess)
                     else
                       "bg-gray-400"
                    end
        text_class = "text-white" if bg_class.length.positive?
      end

      letter = guess[letter_index] if guess.present? && row_index == guess_index + 1

      tag.div(class: "w-10 h-10 border-2 border-black #{bg_class}") do
        tag.p(letter, class: "pr-2 pl-2 pt-1 font-bold #{text_class}")
      end
    end

    def display_key(id, letter, game, width = 10)
      bg_class = "bg-gray-400" if id.between?(1, 26) && game.invalid_letters.index(letter).present?
      button_tag letter, type: "button", class: "w-#{width} h-10 border-2 border-black #{bg_class}", disabled: false, data: { id: id, game_id: game.id, reflex: "click->Game#key_press" }
    end

    private

    def set_amber_color(letter_index, word, guess)
      color = "bg-yellow-500"
      letter = guess[letter_index]
      words = word.split("")
      guesses = guess.split("")
      occurrences = word.count(letter)

      matches = 0
      5.times do |i|
        matches += 1 if letter == words[i] && letter == guesses[i]
      end

      guess_occurences = guess[0..letter_index].count(letter)

      color = "bg-gray-400" if occurrences == matches || guess_occurences > occurrences

      color
    end
  end
end
