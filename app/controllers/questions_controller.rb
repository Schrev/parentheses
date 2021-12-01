class QuestionsController < ApplicationController
  def ask
  end

  def answer
    balanceado(params[:answer])
  end

  def balanceado(string)
    scan = string.split('')
    caritas = string.gsub(/:\(/, '').gsub(/:\)/, '')
    parenthesis = []
    sparenthesis = []
    scan.each do |c|
      if c == '('
        parenthesis << c
      elsif c == ')' && parenthesis.last == '('
        parenthesis.pop
      elsif c == ')'
        parenthesis << c
      end
    end
    caritas.split('').each do |c|
      if c == '('
        sparenthesis << c
      elsif c == ')' && sparenthesis.last == '('
        sparenthesis.pop
      elsif c == ')'
        sparenthesis << c
      end
    end
    if parenthesis.size == 0 || sparenthesis.size == 0
      return @answer = 'balanceado'
    else
      return @answer = 'desbalanceado'
    end
  end
end
