class QuestionsController < ApplicationController
  def rules
  end

  def ask
  end

  def answer
    balanceado(params[:answer])
  end

  def replace(caritas)
    sparenthesis = []
    caritas.sub!(/:[\(\)]/, 'x')
    caritas.split('').each do |c|
      if c == '('
        sparenthesis << c
      elsif c == ')' && sparenthesis.last == '('
        sparenthesis.pop
      elsif c == ')'
        sparenthesis << c
      end
    end
    if sparenthesis.size == 0
    else replace(caritas)
    end
end

def balanceado(string)
    scan = string.split('')
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

    if parenthesis.size == 0
      sparenthesis = []
    else
      replace(string)
    end

    sparenthesis.size == 0 ? @answer = 'Balanceado' : @answer = 'Desbalanceado'

end
end
