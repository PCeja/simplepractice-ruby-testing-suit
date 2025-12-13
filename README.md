<p align='center'>
 <a href='https://github.com/sponsors/alexandresanlim'>
  <img src='https://www.simplepractice.com/icon-512x512.png' width=150 />
 </a>
</p>

<h1 align='center'>
  Welcome! This is a SimplePractice Ruby Testing Suit Example</h1>

  ## 📝 Summary
Add testing suit basics for the SimplePractice POM testing suit using Ruby, RSpec and Capybara.
Ticket: NA

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

### Running Tests
```bash
# Install dependencies
bundle install
# Run tests (headed)
bundle exec rspec
# Run tests (headless)
HEADLESS=true bundle exec rspec
# Force fresh login (delete cached session)
rm tmp/session.cookies && bundle exec rspec

## ✅ Verification & Stress Testing
I ran the following stress test command to ensure the fix is stable:
```bash
for i in {1..20}; do echo "Run #$i"; bundle exec rspec spec/features/task_lifecycle_spec.rb || break; done
