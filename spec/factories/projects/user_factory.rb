FactoryGirl.define do
  factory :projects_user, class: Projects::User do
    project
    user
  end
end
