local M = {}

local uv = vim.uv or vim.loop

function M.is_wsl()
  if vim.fn.has("wsl") == 1 then
    return true
  end
  local uname = uv.os_uname()
  return uname.sysname:find("Microsoft") ~= nil
      or uname.sysname:find("WSL") ~= nil
      or uname.release:find("microsoft") ~= nil
      or uname.release:find("WSL") ~= nil
end

function M.is_mac()
  return vim.fn.has("mac") == 1
end

function M.is_linux()
  return vim.fn.has("linux") == 1 and not M.is_wsl()
end

function M.is_windows()
  return vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1
end

--- Guard: only defines the keymap if the predicate returns true
---@param predicate fun(): boolean
---@param mode string|string[]
---@param lhs string
---@param rhs function|string
---@param opts table|nil
function M.keymap_if(predicate, mode, lhs, rhs, opts)
  if predicate() then
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

return M