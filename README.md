# KPI Dash (Smashing)

Turo-style mock KPI dashboard built on Smashing.

## Dashboards
- Main sample: `/sample`
- Turo KPI TV view: `/sampletv`

## Local setup

### 1) Install Ruby + Bundler
On macOS (Homebrew):
```bash
brew install ruby
gem install bundler
```

On Ubuntu:
```bash
sudo apt-get update
sudo apt-get install -y ruby-full build-essential zlib1g-dev
sudo gem install bundler
```

### 2) Install dependencies
```bash
bundle install
```

### 3) Start dashboard
```bash
bundle exec smashing start -p 3030
```

Then open:
- http://localhost:3030/sample
- http://localhost:3030/sampletv

## Notes
- Data is mock/fake and updates on interval via jobs in `jobs/`.
- Turo KPI widgets are defined in `dashboards/sampletv.erb`.
- KPI event streams are generated in `jobs/sample.rb` and `jobs/convergence.rb`.
