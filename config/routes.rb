Rails.application.routes.draw do
  root 'days#current'

  post 'days/post1'
  post 'days/post2'

  get 'days/day1', to: 'days#day1'
  get 'days/day2', to: 'days#day2'
end
