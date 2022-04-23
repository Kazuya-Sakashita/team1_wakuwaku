CARDS = %W[A 2 3 4 5 6 7 8 9 10 J Q K]

def draw(num)
  CARDS.sample(num)
end

def calc(cards)
  cards.map { |card| convert(card) }.sum
end

def convert(card)
  case card
  when "J", "Q", "K"
    10
  when "A"
    1
  else
    card.to_i
  end
end

dealer_cards = draw(2)
player_cards = draw(2)

def choice(player_cards)
  while true do
    total = calc(player_cards) 
    if total >= 21
      return total
    end
    puts "現在のカードの合計：#{calc(player_cards)}"
    print "カードを引きますか？ (y/n)>"

    if gets.chomp == "y"
      player_cards = player_cards.concat(draw(1))
    else
      return calc(player_cards)
    end
  end
end

puts choice(player_cards)

