# replaces faces on string, one each time it runs
def replace(string)
  string.sub!(/:[\(\)]/, 'x')
end

#stacks parenthesis, returns balanced or not. call replace when needed.
def balanceado(string)
  scan = string.split('')
  stack = []
  balancer = stack.size
  scan.each do |c|
      if c == '('
        parenthesis << c
      elsif c == ')' && parenthesis.last == '('
        parenthesis.pop
      elsif c == ')'
        parenthesis << c
      end
    end

  case balancer
    when 0
      @answer = 'Balanceado'
    when 1
      @answer = 'Desbalanceado'
    when 2 && string.match?(/:[\(\)]/)
      balanceado(replace(string))
    else
      @answer = 'Desbalanceado'
  end
end

string = gets.chomp
balanceado(string)
