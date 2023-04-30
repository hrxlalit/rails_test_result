Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
    # /result_data.json
    namespace :api , constraints: lambda{|request| request.format == :json && request.headers[:Accept] == 'application/ResultAnalyzer' && request.headers[:ApiToken].present? } do
      namespace :v1 , constraints: lambda{|request| request.headers[:ApiVersion] == 'V1' } do
        post '/results_data', to: 'msms#results_data'
      end
    end
end
