<p align='center'>
 <a href='https://github.com/sponsors/alexandresanlim'>
  <img src='https://www.simplepractice.com/icon-512x512.png' width=150 />
 </a>
</p>

<h1 align='center'>
  Welcome!
  <br>
  This is a SimplePractice Ruby Testing Suit Example
</h1>

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
- Login is performed once and cookies are persisted lolcally:  
- Subsequent test runs reuse cached session (~5s vs ~13s per run)
- Auto-expires sessions after 0.5 hours for security -> Since I don't know the real expiration value. -> This can be personalized in the project -> ```SESSION_MAX_AGE_HOURS```
- I used `capybara-sessionkeeper` gem for reliable cookie handling

## 👥 Contributing

### Code Ownership
This project uses a [CODEOWNERS](.github/CODEOWNERS) file to automatically assign reviewers for pull requests.

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

1. Copy the .env example I've provided in the repo

```bash
cp .env.example .env
```

2. Update (With target environment values):

    ```EAMIL``` 

    ```PASSWORD``` 

    ```BASE_URL``` 

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
for i in {1..20}; do echo "Run #$i"; bundle exec rspec spec/features/tasks_spec.rb || break; done
```

### 📁 Project Structure
```
simplepractice-ruby-testing-suit/
├── .github/
│   └── CODEOWNERS         # Code ownership for PR reviews
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

## 👩‍💻 Planned enhancements for the testing framework:

### 👷‍♀️ POM
- [ ] 'Add task' button click can be extracted as a separate action
- [ ] create_task()' action can be updated to support all tasks attributes: 'Task name'(only mandatory), 'Description', 'Due on', 'Priority', 'Client', 'Assigned to', 'Attachments' 

### 🧹 Test Data Cleanup
- [ ] Implement automatic cleanup of test data after successful test execution
- [ ] Add `after` hooks to delete created entities (tasks, appointments, etc.)
- [ ] Create cleanup utilities for orphaned test data
- [ ] Support rollback strategies for failed test runs

### 🌐 Multi-Platform Support
- [ ] Add Firefox browser support via GeckoDriver
- [ ] Add Safari browser support via SafariDriver
- [ ] Configure browser selection via environment variables (`BROWSER=firefox`)
- [ ] Implement cross-browser test matrix for CI/CD pipelines
- [ ] Add mobile browser emulation (Chrome DevTools)

### 👥 Multi-User Session Management
- [ ] Support multiple user session storage (e.g., `tmp/session_admin.cookies`, `tmp/session_client.cookies`) -> Ideally, authentication should be done via API(instead of UI) or long-lived tokens then session stored
- [ ] Implement user role-based session switching within tests
- [ ] Add session isolation for parallel test execution
- [ ] Create session factory for dynamic user provisioning
- [ ] Support concurrent multi-user interaction scenarios

### 🔧 Additional Enhancements
- [ ] Mobile platform support
- [ ] Add CI/CD integration (GitHub Actions)
- [ ] Implement test reporting (Allure, HTML reports)
- [ ] Add screenshot capture on test failure
- [ ] Create reusable test data factories with Faker
