local tablua = { }

local markdown = function(header, rows)
  local row_count = #rows[1]
  local lengths_for_column = { }

  for i=1,#header do
    lengths_for_column[i] = #tostring(header[i])
    for j=1,row_count do
      local to_compare = rows[j][i]
      if to_compare == nil then
        to_compare = ''
      end
      lengths_for_column[i] = math.max(lengths_for_column[i], #tostring(to_compare))
    end
  end

  local outlet = ""
  local line = "|"
  for i, col in pairs(header) do
    local format_string = "%s %-"..lengths_for_column[i].."s |"
    line = string.format(format_string, line, tostring(col))
  end
  outlet = string.format("%s%s\n", outlet, line)

  line = "|"
  for i = 1, #header do
    local length = 2 + lengths_for_column[i]
    for j = 1, length do
      line = line .. "-"
    end
    line = line .. "|"
  end
  outlet = string.format("%s%s\n", outlet, line)

  for j = 1, row_count do
    line = "|"
    for i = 1, #header do
      local format_string = "%s %-"..lengths_for_column[i].."s |"
      local box = rows[j][i]
      if box == nil then
        box = ""
      end
      line = string.format(format_string, line, box)
    end
    outlet = string.format("%s%s\n", outlet, line)
  end

  return outlet
end

function tablua.tabulate(header, rows, format)
  local outlet = nil
  local ops = {
    md = markdown
  }
  local op = ops[format]

  if op ~= nil then
    outlet = op(header, rows)
  end

  return outlet
end

return tablua
