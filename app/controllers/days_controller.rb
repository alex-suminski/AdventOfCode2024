class DaysController < ActionController::Base
    def current

        @answer = TaskInputFetcher.new.call
    end
end
