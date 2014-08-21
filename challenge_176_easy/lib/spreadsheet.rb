class String
  def bijective26
    ('A'..'ZZ').to_a.find_index(self)
  end
end

class Spreadsheet
  
  def initialize
  end

  def select_cells(selection)
    base, minus = selection.split("~")
    evaluate(base) - evaluate(minus)
  end

  def print_selected_cells(selection)
    cells = select_cells(selection)
    puts cells.size
    cells.each {|cell| puts "#{cell[0]}, #{cell[1]}"}
  end
  
  private

  def evaluate(str)
    return [] if str.nil?

    selections = str.split("&")
    result = []
    selections.each do |selection|
      if selection.include?(':')
        result.concat(calculate_range(selection))
      elsif
        result.push(convert_cell(selection))
      end
    end
    result
  end

  def calculate_range(range)
    from, to = /(.*):(.*)/.match(range).captures
    from = convert_cell(from)
    to = convert_cell(to)
    (from[0]..to[0]).to_a.product((from[1]..to[1]).to_a)
  end

  def convert_cell(cell)
    column, row = /(\D+)(\d+)/.match(cell).captures
    Array.new.push( column.bijective26, row.to_i - 1 )
  end
  
end

Spreadsheet.new.print_selected_cells("B1:B3&B4:E10&F1:G1&F4~C5:C8&B2")