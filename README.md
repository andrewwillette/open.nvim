# open.nvim
Neovim plugin to configure keymaps for selecting an item and open it's corresponding URL.

```lua
local openvim = require("open")
opennvim.set_keymap("bm", {
  {name="google", url="https://google.com"},
  {name="facebook", url="https://facebook.com"},
})
```
