return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
  --   "BufReadPre path/to/my-vault/**.md",
  --   "BufNewFile path/to/my-vault/**.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/Documents/personal/conocimientos/wforeros",
      },
      {
        name = "personal",
        path = "~/Documents/3pi/dev/documentacion",
      },
    },
    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },
    notes_subdir = "199 - 💡 IDEAS",
    new_notes_location = "199 - 💡 IDEAS",
    daily_notes = {
      -- Optional, if you keep daily notes in a separate directory.
      folder = "800 - 📆 REGISTRO/Diario",
      -- Optional, if you want to change the date format for the ID of daily notes.
      date_format = "%Y-%m-%d",
      -- Optional, if you want to change the date format of the default alias of daily notes.
      alias_format = "%B %-d, %Y",
      -- Optional, default tags to add to each new daily note created.
      default_tags = { "Nota/Diaria" },
      -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
      template = "900 - 🛠 RECURSOS/Plantillas/Registro Diario.md",
    },
    mappings = {
      -- "Obsidian follow"
      ["<leader>of"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      -- Toggle check-boxes "obsidian done"
      ["<leader>od"] = {
        action = function()
          return require("obsidian").util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },
      -- Create a new newsletter issue
      ["<leader>onn"] = {
        action = function()
          return require("obsidian").commands.new_note("Newsletter-Issue")
        end,
        opts = { buffer = true },
      },
      ["<leader>ont"] = {
        action = function()
          return require("obsidian").util.insert_template("Newsletter-Issue")
        end,
        opts = { buffer = true },
      },
    },
    templates = {
      subdir = "900 - 🛠 RECURSOS/Plantillas",
      date_format = "%Y-%m-%d-%a",
      gtime_format = "%H:%M",
      tags = "",
    },
    note_id_func = function(title)
      -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
      -- In this case a note with the title 'My new note' will be given an ID that looks
      -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
      local suffix = ""
      if title ~= nil then
        -- If title is given, transform it into valid file name.
        suffix = title
      else
        -- If title is nil, just add 4 random uppercase letters to the suffix.
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end
      return suffix
    end,
    -- diable_frontmatter = true,
    -- note_frontmatter_func = function(note)
    --   -- Add the title of the note as an alias.
    --   if note.title then
    --     note:add_alias(note.title)
    --   end
    --
    --   local id = note.id
    --   if string.find(id, "-") == nil then
    --     id = note.id:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower() .. "-" .. tostring(os.time())
    --   end
    --
    --   local out = { id = id, aliases = note.aliases, tags = note.tags, meta = note.metadata }
    --
    --   -- `note.metadata` contains any manually added fields in the frontmatter.
    --   -- So here we just make sure those fields are kept in the frontmatter.
    --   -- function tableToString(t)
    --   --   local result = "{"
    --   --   local first = true
    --   --   for k, v in pairs(t) do
    --   --     if not first then
    --   --       result = result .. ", "
    --   --     end
    --   --     first = false
    --   --     local keyString = tostring(k)
    --   --     local valueString
    --   --     if type(v) == "table" then
    --   --       valueString = tableToString(v)
    --   --     else
    --   --       valueString = tostring(v)
    --   --     end
    --   --     result = result .. keyString .. ", "
    --   --     print(keyString)
    --   --   end
    --   --   result = result .. "}"
    --   --   return result
    --   -- end
    --   -- if note.metadata ~= nil then
    --   --   print(tableToString(note.metadata))
    --   -- else
    --   --   print("no metadata")
    --   -- end
    --   -- if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
    --   --   for k, v in pairs(note.metadata) do
    --   --     out[k] = v
    --   --   end
    --   -- end
    --
    --   --
    --   -- if note.metadata == nil or vim.tbl_isempty(note.metadata) then
    --   --   note.metadata = {}
    --   -- end
    --   -- if note.metadata["Fecha de Creación"] == nil then
    --   --   note.metadata["Fecha de Creación"] = os.date("%Y-%m-%d %H:%M:%S")
    --   -- end
    --   -- out["Fecha de Creación"] = note.metadata["Fecha de Creación"]
    --   -- out["Última Modificación"] = os.date("%Y-%m-%d %H:%M:%S")
    --   return out
    -- end,
  },
}
