<p align='center'>
 <a href='https://github.com/sponsors/alexandresanlim'>
  <img src='https://www.simplepractice.com/icon-512x512.png' width=150 />
 </a>
</p>

<h1 align='center'>
  Welcome! This is a SimplePractice Ruby Testing Suit Example</h1>

  ## 📝 Summary
SimplePractice POM testing suit that uses Ruby, RSpec and Capybara.

### Tech Stack
| Category | Technology |
|----------|------------|
| Test Framework | RSpec |
| Browser Automation | Capybara  |
| Page Object Model | SitePrism |
| Session Management | capybara-sessionkeeper |
| Test Data | Faker |
| Configuration | dotenv |

### Key Features
**🔐 Cookie-Based Session Management**
- Login is performed once and cookies are persisted locally:  
- Subsequent test runs reuse cached session (~5s vs ~13s per run)
- Auto-expires sessions after 4 hours for security -> Since I don't know the real expiration value. -> This can be personalized in the project. 
- I used `capybara-sessionkeeper` gem for reliable cookie handling

## 🔧 Prerequisites to run the tests
Before getting started, ensure you have the following installed:

| Requirement | Version | Installation |
|-------------|---------|--------------|
| Ruby | 3.3.0 | [rbenv](https://github.com/rbenv/rbenv) or [rvm](https://rvm.io/) |
| Bundler | Latest | `gem install bundler` |
| Chrome | Latest | [Download](https://www.google.com/chrome/) |
| ChromeDriver | Matching Chrome version | `brew install chromedriver` (macOS) |

## 🚀 Getting Started

### 🗳️ Clone the repository
```bash
git clone [https://github.com/your-username/simplepractice-ruby-testing-suit.git](https://github.com/your-username/simplepractice-ruby-testing-suit.git)
cd simplepractice-ruby-testing-suit
```

### 🔐 Environment Configuration

This project uses environment variables to securely store credentials. **Never commit your [.env]mfile to version control.**

### 📝 Create your [.env](/simplepractice-ruby-testing-suit/.env:) file

1. You can also use the .env.example I've provided in the repo -> Update the EAMIL, PASSWORD and BASE_URL 

```bash
cp .env.example .env
```

### 🧪 Running Tests

#### 📦 Install Ruby
```bash
rbenv install 3.3.0  # if using rbenv
# or
rvm install 3.3.0    # if using rvm
```

#### 📦 Install dependencies
```bash
bundle install
```

#### ✅ Run all tests (headed browser - you'll see Chrome open)
```bash
bundle exec rspec
```

#### ✅ Run tests in headless mode (no visible browser)
```bash
HEADLESS=true bundle exec rspec
```

#### ✅ Run a specific test file
```bash
bundle exec rspec spec/features/tasks_spec.rb
```

#### 🍪 Force fresh login (clears cached session cookies)
```bash
rm -f tmp/session.cookies && bundle exec rspec
```

#### ✅ Verification & Stress Testing
I ran the following stress test command to ensure the fix is stable:
```bash
for i in {1..20}; do echo "Run #$i"; bundle exec rspec spec/features/task_lifecycle_spec.rb || break; done
```

### 📁 Project Structure
```
simplepractice-ruby-testing-suit/
├── spec/
│   ├── features/          # Feature/integration tests
│   ├── support/           # Page objects, helpers, config
│   └── spec_helper.rb     # RSpec configuration
├── tmp/                   # Cached session cookies (gitignored)
├── .env                   # Credentials (gitignored)
├── .env.example           # Template for .env file
├── Gemfile                # Ruby dependencies
└── README.md
```
