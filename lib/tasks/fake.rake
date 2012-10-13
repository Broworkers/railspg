namespace :db do
  desc 'Create a fake database'
  task fake: %w[ db:drop db:seed db:fake:user ]

  namespace :fake do
    desc 'Create fake users'
    task user: :environment do
      user = FactoryGirl.create(:user, email: 'foobar@example.com')

      10.times do
        user = FactoryGirl.create(:user)
      end
    end
  end
end
