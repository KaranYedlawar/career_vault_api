# CareerVault API

CareerVault API — production-grade Rails API for job listings, applications, and recruiter workflows.

## Tech

- Ruby on Rails (API only)
- PostgreSQL
- RSpec, FactoryBot
- Sidekiq + Redis (later)
- ActionCable (later)

## Local setup

1. `bundle install`
2. configure `config/database.yml` (local Postgres)
3. `rails db:create db:migrate`
4. `bundle exec rspec`
5. `rails s`

## Notes

- Project name: CareerVault API
- Workflow: daily commits to GitHub (feature branches → merge to dev → merge to main)
