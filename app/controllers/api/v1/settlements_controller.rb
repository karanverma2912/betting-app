module Api
  module V1
    class SettlementsController < ApplicationController
      def create
        match = Match.find(params[:match_id])
        Bets::Settle.call(match: match, winning_selection_id: params.require(:winning_selection_id))
        render json: match.reload
      rescue ActiveRecord::RecordInvalid, ArgumentError => e
        render json: { error: e.message }, status: :unprocessable_entity
      end
    end
  end
end
