local open = {}

local function open_url(url)
  local os_name = vim.loop.os_uname().sysname
  if os_name == "Darwin" then
    vim.fn.system("open '" .. url .. "'")
  elseif os_name == "Linux" then
    vim.fn.system("xdg-open '" .. url .. "'")
  elseif os_name:match("Windows") then
    vim.fn.system("cmd.exe /c start " .. url)
  else
    error("Unsupported OS: " .. os_name)
  end
end

--- Set a keymap that allows the user to open a selection of predefined URLs.
---
--- @param keymap string: The key sequence to trigger the URL selection.
--- @param to_open table: A table where each key is a display name and each value is a URL string.
function open.set_keymap(keymap, to_open)
  local select_options = vim.tbl_keys(to_open)
  vim.keymap.set("n", keymap, function()
    vim.ui.select(select_options, {
      prompt = 'Open the URL:',
    }, function(choice)
      if choice then
        open_url(to_open[choice])
      end
    end)
  end, { silent = true })
end

return open
