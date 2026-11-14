module Bets
  class Settle
    def self.call(match:, winning_selection_id:)
      Match.transaction do
        match.lock!
        raise ArgumentError, "match already settled" if match.finished?

        match.markets.each { |market| market.update!(status: :settled) }
        match.bets.find_each do |bet|
          if bet.selection_id.to_i == winning_selection_id.to_i
            bet.update!(status: :won, payout: (bet.stake * bet.odds).round)
          else
            bet.update!(status: :lost, payout: 0)
          end
        end
        match.update!(status: :finished, result_selection_id: winning_selection_id)
        match
      end
    end
  end
end
