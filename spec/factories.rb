FactoryGirl.define do

  factory :post, class: Stormy::Post do 
    sequence(:name) { |n|  "This is Post #{n}" }
    post_type "post"
    body "Here be the body of the post"
  end

  factory :page, class: Stormy::Post  do 
    sequence(:name) { |n| "This is Page #{n}" }
    post_type "page"
    body "Here be the body of the post"
  end
end
