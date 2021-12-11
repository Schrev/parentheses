class QuestionsController < ApplicationController
  def rules
  end

  def ask
  end

  def answer
    balanceado(params[:answer])
  end

  # replaces faces on string, one each time it runs
  def replace(caritas)
    caritas.sub!(/:[\(\)]/, 'x')
  end

  # stacks parenthesis, returns balanced or not. call replace when needed.
  def balanceado(string)
    scan = string.split('')
    stack = []

    scan.each do |c|
      if c == '('
        stack << c
      elsif c == ')' && stack.last == '('
        stack.pop
      elsif c == ')'
        stack << c
      end
    end

    balancer = stack.size

    case balancer
      when 0
        @answer = 'Balanceado'
      else
        if string.match?(/:[\(\)]/)
          replace(string)
          balanceado(string)
        else
          @answer = 'Desbalanceado'
        end
    end
  end
end
