# README

# Game

Rails [Wordle](https://www.nytimes.com/games/wordle/index.html) clone.

You can play it [here](https://immense-earth-67664.herokuapp.com/).
Create an account.

Press New Game. 

Same rules as wordle... 
* 5 Letter word
* 6 guesses 
* green=correct 
* amber=correct letter wrong spot 
* grey = letter does not appear in word 

Words checked against those installed in the database. 

# Tech

* Ruby 2.7.0

* Rails 6.1

* Stimulus Reflex 3.4

* Tailwind CSS

* rails db:create

* rails db:migrate

* rails db:seed (install word)

* rails s

* As you can see on the link you can deploy on heroku. Need to use redis-to-go or equivalent.

# Run Locally 

```foreman start -f Procfile.dev```
