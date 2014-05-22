# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    title "Rescue Captain Amazing"
    description "Rescue Captain Amazing from the HQ of Casanova Frankenstein."
    due_date { 2.days.since }
    state_name 'new'
  end
end
