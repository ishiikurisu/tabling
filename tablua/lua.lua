local tablua = { }

local markdown = function(header, rows)
  return 'TODO implement me!'
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
