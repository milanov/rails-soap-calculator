class CalcController < ApplicationController
  soap_service namespace: 'urn:Calc'

  soap_action "add",
              :args   => { left_operand: :double, right_operand: :double },
              :return => :double
  def add
    render :soap => params[:left_operand] + params[:right_operand]
  end

  soap_action "sub",
              :args   => { left_operand: :double, right_operand: :double },
              :return => :double
  def sub
    render :soap => params[:left_operand] - params[:right_operand]
  end

  soap_action "mul",
              :args   => { left_operand: :double, right_operand: :double },
              :return => :double
  def mul
    render :soap => params[:left_operand] * params[:right_operand]
  end

  soap_action "div",
              :args   => { left_operand: :double, right_operand: :double },
              :return => :nil
  def div
    raise SOAPError, "division by zero" if params[:right_operand].zero?

    render :soap => params[:left_operand] / params[:right_operand]
  end

end
