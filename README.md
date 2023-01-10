# RailsComments

> Still in beta

A modern way to add comments to your Rails app powered by Hotwire.

## Installation
Add this line to your application's Gemfile:

```ruby
gem "rails_comments"
```

And then execute:
```bash
$ bundle
```

## Usage

1. Include the `RailsComments::Commentable` module to the model you want to add comments.

```ruby
class Post < ApplicationRecord
  include RailsComments::Commentable
end
```

2. Add the assets to your layout file

```erb
<!-- app/views/layouts/application.html.erb -->
<%= rails_comments_assets %>
```

3. Add the thread to your model's show page.

```erb
<!-- app/views/posts/show.html.erb -->
<%= comments_for @post %>
```

4. Mount the engine

```ruby
# config/routes.rb
mount RailsComments::Engine => "/rails_comments"
```

5. Copy the migrations

```bash
bin/rails rails_comments:install:migrations
bin/rails db:migrate
```

## Still to do

There are still a few things that need to be done in order to make this a full-featured commenting gem. If you want to help out we're glad to help you navigate the codebase.

 - [ ] send emails
 - [ ] custom author (the database supports that the external APIs don't)

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
