class CalculatorsController < ApplicationController
  before_action :authenticate_user!

  def index
    @funds = Funds.all_funds
  end

  def calculate
    @fund = Funds.all_funds[params[:fund_name]]
    render status: :not_found && return unless @fund && @fund[Funds::SHARE_CLASS_R6].present?

    @fund_name = params[:fund_name]
    @aum = params[:aum].to_f
    @num_accounts = params[:num_accounts].to_i
    @cash = params[:cash].to_f
    @num_trades_per_year = params[:num_trades_per_year].to_f
    @cost_per_trade = params[:cost_per_trade].to_f

    render :show
  end


end
