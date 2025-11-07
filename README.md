# open.nvim
Neovim plugin to configure keymaps for selecting an item and open it's corresponding URL.

```lua
local open = require("open")

open.set_keymap("<leader>bm", {
  google = "https://google.com",
  ["reddit board"] = "https://reddit.com",
})
```
