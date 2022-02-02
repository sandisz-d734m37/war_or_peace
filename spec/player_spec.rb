require './lib/card'
require './lib/deck'
require './lib/player'
require 'pry'

RSpec.describe Player do
  context 'Player' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])

    it 'has a name and a deck' do
      player = Player.new('Clarisa', deck)
      # binding.pry
      expect(player.name).to eq('Clarisa')
      expect(player.deck).to eq(deck)
    end
    it 'can determine if it has lost' do
      player = Player.new('Clarisa', deck)
      expect(player.has_lost?).to eq(false)
      player.deck.remove_card
      expect(player.has_lost?).to eq(false)
      player.deck.remove_card
      expect(player.has_lost?).to eq(false)
      player.deck.remove_card
      expect(player.has_lost?).to eq(true)
    end
  end
end
