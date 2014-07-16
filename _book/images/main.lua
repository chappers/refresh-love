function love.load()

  Tileset = love.graphics.newImage('countryside.png')

  TileW, TileH = 32,32
  local tilesetW, tilesetH = Tileset:getWidth(), Tileset:getHeight()

    local quadInfo = {
      {'.', 0, 0},  -- grass
      {'#', 32, 0}, -- box
      {'*', 0, 32}, -- flowers
      {'^',32, 32}  -- boxtop
    }

    Quads = {}
    for _, info in ipairs(quadInfo) do
      -- info[1] = char, info[2] = x, info[3] = y
      Quads[info[1]] = love.graphics.newQuad(info[2], info[3], TileW, TileH, tilesetW, tilesetH)
    end

  local tileString = [[
...
.#*.
...
]]

  TileTable = {}
  local width = #(tileString:match("[^\n]+"))
  for x=1,width,1 do TileTable[x] = {} end -- initilaise correct dim
  
  local rowIndex, columnIndex = 1,1
  for row in tileString:gmatch("[^\n]+") do
    columnIndex = 1
    for chr in row:gmatch(".") do
      TileTable[rowIndex][columnIndex] = chr
      columnIndex = columnIndex + 1
    end
    rowIndex = rowIndex+1
  end  
end

function love.draw()
  for rowIndex, row in ipairs(TileTable) do
    for colIndex, chr in ipairs(row) do
      local x,y = 250+(colIndex-1)*TileW, 250+(rowIndex-1)*TileH
      love.graphics.draw(Tileset, Quads[chr], x,y)
    end
  end
end

