# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    sequence(:title) {|n| "Task number #{n}" }
    sequence(:description) {|n| "Task description #{n}" }
    state_name 'new'
  end

  factory :task_rescue_amazing do
    title "Rescue Captain Amazing"
    description "Rescue Captain Amazing from the HQ of Casanova Frankenstein."
    due_date { 2.days.since }
    state_name 'new'
  end

  factory :task_with_due_date, parent: :task do
    due_date { (1..5).to_a.sample.days.since }
  end
end
