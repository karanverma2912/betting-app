# DemoBet

Virtual sports betting simulator built as a Rails API. All balances, stakes, odds, and payouts are virtual only.

## Phase 2

This phase adds the sports engine foundation:

- sports and fixtures
- markets and selections
- immutable odds snapshots
- server-side bet placement
- idempotent settlement service

## Local setup

```bash
bundle install
bin/rails db:create db:migrate
bin/rails server
```

The API is designed to sit behind the Phase 1 authentication and wallet services. No credentials or provider secrets are committed.
