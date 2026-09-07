vim.g.mapleader = ' '

vim.keymap.set('n', 'Q', '<nop>')
vim.keymap.set('n', '~', 'i`')

--
-- Moving around...
--
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<leader>[', ':bp<CR>')
vim.keymap.set('n', '<leader>]', ':bn<CR>')
vim.keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz')
vim.keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz')
vim.keymap.set('n', 'sv', ':vsplit<CR>')
vim.keymap.set('n', 'sh', ':split<CR>')

--
-- Text operations.
-- 
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set('n', '<leader>r', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word under cursor" })
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], { desc = "Yank to the system clipboard" })
vim.keymap.set('n', '<leader>Y', [["+Y]], { desc = "Yank to current line to the system clipboard" })
vim.keymap.set('x', '<leader>p', [["_dP]], { desc = "Paste from the system clipboard" })
vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz', { desc = "Next quickfix" })
vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz', { desc = "Previous quickfix" })
vim.keymap.set("n", "<leader>a", "ggVG", { desc = "Select the entire file" })
vim.keymap.set("n", "gs", "ciW``<Esc>P", { noremap = true }, { desc = "Surround the current word with backticks" })

vim.keymap.set("v", "<", "<gv", { desc = "Keep visual selections after increasing indention" })
vim.keymap.set("v", ">", ">gv", { desc = "Keep visual selections after decreasing indention" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Don't lose your place when joining lines" })

vim.keymap.set('n', '<leader>o.', ':Oil .<CR>', { desc = "Open Oil in the current file's directory" })
vim.keymap.set('n', '<leader>oh', ':Oil<CR>', { desc = "Open Oil in the current working directory" })

--
-- Enabling stuff.
-- 
vim.keymap.set('n', '<leader>eg', ":Goyo<CR>")
vim.keymap.set('n', '<leader>ec', ':set cursorline! cursorcolumn!<CR>')
vim.keymap.set('n', '<leader>es', ':setlocal spell! spelllang=en_us<CR>')
vim.keymap.set('n', '<leader>el', ':Limelight!!<CR>')
vim.keymap.set('n', '<leader>en', ':set number!<CR>:set relativenumber!<CR>')

vim.keymap.set('n', '<leader>ts', "m'A<C-R>=strftime('%Y%m%dT%H%M%S')<CR>")
vim.keymap.set('n', '<leader>td', "a<C-R>=strftime('%Y-%m-%d')<CR>")

--
-- Inserting some special characters.
-- 
vim.keymap.set('i', ';;k', '✅', { noremap = true })
vim.keymap.set('i', ';;x', '❌', { noremap = true })
vim.keymap.set('i', ';;q', '❔', { noremap = true })


local function new_daily_note()
  local date = os.date("%Y-%m-%d")
  local filename = date .. ".md"

  vim.cmd("edit " .. filename)

  vim.api.nvim_buf_set_lines(0, 0, -1, false, {
    "# " .. date,
    "",
    "",
  })

  -- Put the cursor on the third line and enter Insert mode.
  vim.api.nvim_win_set_cursor(0, { 3, 0 })
  vim.cmd("startinsert")
end

vim.keymap.set("n", "<leader>nn", new_daily_note, { desc = "New daily note" })

if vim.g.vscode then
  local vscode = require 'vscode-neovim'

  vim.keymap.set('n', 'sv', function()
    vscode.action 'workbench.action.splitEditorRight'
  end, { desc = 'Split vertically' })

  vim.keymap.set('n', 'sh', function()
    vscode.action 'workbench.action.splitEditorDown'
  end, { desc = 'Split horizontally' })
end

local logs_dir = vim.fn.expand("~/logs")

local function latest_logs_by_service()
  local files = vim.fn.globpath(logs_dir, "*.log", false, true)
  local latest = {}

  for _, file in ipairs(files) do
    local name = vim.fn.fnamemodify(file, ":t")
    local service, date = name:match("^(.*)%-(%d%d%d%d%-%d%d%-%d%d)%.log$")

    if service and date then
      local cur = latest[service]
      if not cur or date > cur.date then
        latest[service] = {
          date = date,
          file = file,
        }
      end
    end
  end

  return latest
end

--
-- Keybindings for managing log files.
-- 

local function pick_service(on_select)
  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")
  local conf = require("telescope.config").values
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")

  local latest = latest_logs_by_service()
  local services = vim.tbl_keys(latest)

  table.sort(services)

  pickers.new({}, {
    prompt_title = "Services",
    finder = finders.new_table({
      results = services,
    }),
    sorter = conf.generic_sorter({}),
    attach_mappings = function(prompt_bufnr)
      actions.select_default:replace(function()
        local entry = action_state.get_selected_entry()
        local service = entry[1]

        actions.close(prompt_bufnr)
        on_select(service, latest[service].file)
      end)

      return true
    end,
  }):find()
end

local function open_latest_log()
  pick_service(function(_, file)
    vim.cmd.edit(vim.fn.fnameescape(file))
  end)
end

local function grep_latest_log()
  local builtin = require("telescope.builtin")

  pick_service(function(service, file)
    builtin.live_grep({
      prompt_title = "Search " .. service .. " (latest log)",
      search_dirs = { file },
    })
  end)
end

local function find_log_file()
  local builtin = require('telescope.builtin')

  builtin.find_files({
    prompt_title = 'Log files',
    cwd = logs_dir,
    find_command = {
      'rg',
      '--files',
      '-g',
      '*-*.log',
    },
  })
end

local function pick_docker_container(on_select)
  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")
  local conf = require("telescope.config").values
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")

  local containers = vim.fn.systemlist("docker ps --format '{{.Names}}'")

  if vim.v.shell_error ~= 0 or #containers == 0 then
    vim.notify("No running Docker containers found", vim.log.levels.WARN)
    return
  end

  pickers.new({}, {
    prompt_title = "Docker Containers",
    finder = finders.new_table({ results = containers }),
    sorter = conf.generic_sorter({}),
    attach_mappings = function(prompt_bufnr)
      actions.select_default:replace(function()
        local entry = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        on_select(entry[1])
      end)
      return true
    end,
  }):find()
end

local docker_jobs = {}

local function open_docker_logs()
  pick_docker_container(function(container)
    local buf = vim.api.nvim_create_buf(false, true)
    vim.bo[buf].buftype = "nofile"
    vim.bo[buf].bufhidden = "wipe"
    vim.api.nvim_buf_set_name(buf, "docker://" .. container)

    vim.cmd("split")
    vim.api.nvim_win_set_buf(0, buf)

    local follow = true

    local function append(data)
      vim.schedule(function()
        if not vim.api.nvim_buf_is_valid(buf) then return end
        vim.api.nvim_buf_set_lines(buf, -1, -1, false, data)
        if follow then
          local win = vim.fn.bufwinid(buf)
          if win ~= -1 then
            vim.api.nvim_win_set_cursor(win, { vim.api.nvim_buf_line_count(buf), 0 })
          end
        end
      end)
    end

    local job = vim.fn.jobstart({ "docker", "logs", "-f", container }, {
      stdout_buffered = false,
      on_stdout = function(_, data) if data then append(data) end end,
      on_stderr = function(_, data) if data then append(data) end end,
      on_exit = function()
        vim.schedule(function()
          if vim.api.nvim_buf_is_valid(buf) then
            vim.api.nvim_buf_set_lines(buf, -1, -1, false, { "", "[docker logs exited]" })
          end
        end)
        docker_jobs[buf] = nil
      end,
    })

    docker_jobs[buf] = job

    -- toggle follow with <leader>f inside the log buffer
    vim.keymap.set("n", "<leader>f", function()
      follow = not follow
      vim.notify("Docker log follow: " .. (follow and "ON" or "OFF"))
    end, { buffer = buf, desc = "Toggle docker log follow" })

    -- stop the job when the buffer is wiped
    vim.api.nvim_create_autocmd("BufWipeout", {
      buffer = buf,
      once = true,
      callback = function()
        local j = docker_jobs[buf]
        if j then vim.fn.jobstop(j) end
        docker_jobs[buf] = nil
      end,
    })
  end)
end

vim.keymap.set('n', '<leader>lf', find_log_file, { desc = 'Find log file' })
vim.keymap.set("n", "<leader>ll", open_latest_log, { desc = "Open latest log for service" })
vim.keymap.set("n", "<leader>ls", grep_latest_log, { desc = "Search latest log for service" })
vim.keymap.set("n", "<leader>ld", open_docker_logs, { desc = "Stream Docker container logs" })

vim.api.nvim_create_user_command('LogFiles', find_log_file, {})
vim.api.nvim_create_user_command("LatestLog", open_latest_log, {})
vim.api.nvim_create_user_command("LatestLogSearch", grep_latest_log, {})
