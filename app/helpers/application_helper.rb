module ApplicationHelper
  def checkLine(line)
      if line =~ /Perl|Python/
        return line
      else
        return ''
      end
  end
end
