namespace :comments do
  desc "Build for release"
  task :build do
    `yarn build:css`
    `cp -r ./app/assets/builds/* ./public/rails_comments_assets`
  end
end
