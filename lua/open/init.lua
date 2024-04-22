local open = {}

---@class OpenSelection
---@field name string
---@field url string

---@param keymap string
---@param to_open OpenSelection[]
function open.set_keymap(keymap, to_open)
  local select_options = {}
  for _, v in pairs(to_open) do
    table.insert(select_options, v.name)
  end
  vim.keymap.set("n", keymap, function()
    vim.ui.select(select_options, {
      prompt = 'Open the URL:',
    }, function(choice)
      for _, v in pairs(to_open) do
        if v.name == choice then
          vim.fn.system("open '" .. v.url .. "'")
        end
      end
    end)
  end, { silent = true })
end

return open
