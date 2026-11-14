module Api
  module V1
    class MatchesController < ApplicationController
      def index
        matches = Match.includes(:sport, markets: :selections).where(status: [:scheduled, :live]).order(:starts_at)
        render json: matches.as_json(include: { sport: {}, markets: { include: :selections } })
      end

      def show
        match = Match.includes(markets: :selections).find(params[:id])
        render json: match.as_json(include: { markets: { include: :selections } })
      end
    end
  end
end
