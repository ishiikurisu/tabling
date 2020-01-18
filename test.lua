local tablua = require "tablua.lua"

-- test data
local header = { 'Name', 'Address', 'Age' }
local stuff = {
  { 'Angela Ziegler', 'Zurich, Switzerland', 40 },
  { 'Jack Morrison', 'Nowhere', 76 },
  { 'Zenyatta', 'Nepal', nil }
}

local test = function(format, expected, gotten)
  if gotten ~= expected then
    print("---")
    print("format: " .. format)
    print("result: >")
    print(gotten)
  end
end

local markdown = function()
  local expected = [[| Name           | Address             | Age |
|----------------|---------------------|-----|
| Angela Ziegler | Zurich, Switzerland | 40  |
| Jack Morrison  | Nowhere             | 76  |
| Zenyatta       | Nepal               |     |
]]
  local gotten = tablua.tabulate(header, stuff, 'md')
  test('md', expected, gotten)
end

local orgMode = function()
  local expected = [[| Name           | Address             | Age |
|----------------+---------------------+-----|
| Angela Ziegler | Zurich, Switzerland | 40  |
| Jack Morrison  | Nowhere             | 76  |
| Zenyatta       | Nepal               |     |
]]
  local gotten = tablua.tabulate(header, stuff, 'org')
  test('org', expected, gotten)
end

local json = function()
  local expected = [[
[
  {
    "Name": "Angela Ziegler",
    "Address": "Zurich, Switzerland",
    "Age": 40
  },
  {
    "Name": "Jack Morrison",
    "Address": "Nowhere",
    "Age": 76
  },
  {
    "Name": "Zenyatta",
    "Address": "Nepal",
    "Age": null
  }
]
]]
  local gotten = tablua.tabulate(header, stuff, 'json')
  test('json', expected, gotten)
end

local scenarios = {
  markdown,
  orgMode,
  json
}

for i = 1,#scenarios do
  scenarios[i]()
end
