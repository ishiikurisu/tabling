-- test data
local header = { 'Name', 'Address', 'Age' }
local stuff = {
  { 'Angela Ziegler', 'Zurich, Switzerland', 40 },
  { 'Jack Morrison', 'Nowhere', 76 },
  { 'Zenyatta', 'Nepal', nil }
}

-- markdown table
local expected = [[| name           | address             | age |
|----------------|---------------------|-----|
| Angela Ziegler | Zurich, Switzerland | 40  |
| Jack Morrison  | Nowhere             | 76  |
| Zenyatta       | Nepal               |     |
]]
