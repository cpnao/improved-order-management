class Representative::TodayController < ApplicationController
  require 'date'

  def index
    @orders = Order.all

    @year = Date.today.year
    @this_month = Date.today.month
    @last_month = Date.today.month-1
    @this_month = @year.to_s + "-" + @this_month.to_s
    @last_month = @year.to_s + "-" + @last_month.to_s

    @from = DateTime.now.beginning_of_day - 9.hour
    @to = @from+1
  end
end