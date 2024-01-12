# Clinic management system
test
# 1. Prerequisites
- Ruby 3.2.2
- Rails 7.1.2

# 2. Clone project and preparation:
- Clone the project with ssh
```
git@github.com:HopeeSolutionsRuby/demo-app.git
```
- Open your terminal then cd to the project home
```
cd demo-app
```

# 3. Configure mysql db connection
- Create file .env which is the same as the .env.template
- Replace default value with your correct information (username, password of mysql,...)

# 4. Create db schema
- Run
```
rails db:create
```

# 5. Install dependencies
```
bundle install
```

# 6. Run db migrations
```
rails db:migrate
```

# 7. Start rails server
```
rails s
```

# 8. Access app
- Rails API root url: http://localhost:3000
