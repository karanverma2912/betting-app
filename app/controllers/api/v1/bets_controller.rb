module Api
  module V1
    class BetsController < ApplicationController
      def create
        selection = Selection.find(params.require(:selection_id))
        bet = Bets::Place.call(
          user: respond_to?(:current_user) ? current_user : nil,
          selection: selection,
          stake: params.require(:stake).to_i,
          idempotency_key: request.headers["Idempotency-Key"] || params.require(:idempotency_key)
        )
        render json: bet, status: :created
      rescue ActiveRecord::RecordInvalid, ArgumentError => e
        render json: { error: e.message }, status: :unprocessable_entity
      end
    end
  end
end
