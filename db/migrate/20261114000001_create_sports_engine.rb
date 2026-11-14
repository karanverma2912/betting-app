class CreateSportsEngine < ActiveRecord::Migration[8.0]
  def change
    create_table :sports do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.timestamps
    end
    add_index :sports, :slug, unique: true

    create_table :matches do |t|
      t.references :sport, null: false, foreign_key: true
      t.string :home_team, null: false
      t.string :away_team, null: false
      t.datetime :starts_at, null: false
      t.integer :status, null: false, default: 0
      t.integer :result_selection_id
      t.timestamps
    end

    create_table :markets do |t|
      t.references :match, null: false, foreign_key: true
      t.string :name, null: false
      t.integer :status, null: false, default: 0
      t.timestamps
    end

    create_table :selections do |t|
      t.references :market, null: false, foreign_key: true
      t.string :label, null: false
      t.decimal :current_odds, precision: 10, scale: 4, null: false
      t.timestamps
    end

    create_table :odds_snapshots do |t|
      t.references :selection, null: false, foreign_key: true
      t.decimal :odds, precision: 10, scale: 4, null: false
      t.datetime :captured_at, null: false
      t.timestamps
    end

    create_table :bets do |t|
      t.references :user, foreign_key: true
      t.references :match, null: false, foreign_key: true
      t.references :selection, null: false, foreign_key: true
      t.bigint :stake, null: false
      t.decimal :odds, precision: 10, scale: 4, null: false
      t.bigint :payout, null: false, default: 0
      t.integer :status, null: false, default: 0
      t.string :idempotency_key, null: false
      t.timestamps
    end
    add_index :bets, :idempotency_key, unique: true
  end
end
