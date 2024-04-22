local open = {}

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
          vim.fn.system("open " .. v.url)
        end
      end
    end)
  end, { silent = true })
end

open.set_keymap("<leader>tm", {
  { name = "google", url = "https://google.com" },
  { name = "yahoo",  url = "https://yahoo.com" },
})

return open