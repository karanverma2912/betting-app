module Bets
  class Place
    def self.call(user:, selection:, stake:, idempotency_key:)
      existing = Bet.find_by(idempotency_key: idempotency_key)
      return existing if existing

      match = selection.market.match
      raise ArgumentError, "match is not open for betting" unless match.scheduled?
      raise ArgumentError, "market is not open" unless selection.market.open?

      Bet.create!(
        user: user,
        match: match,
        selection: selection,
        stake: stake,
        odds: selection.current_odds,
        idempotency_key: idempotency_key,
        status: :pending
      )
    end
  end
end
