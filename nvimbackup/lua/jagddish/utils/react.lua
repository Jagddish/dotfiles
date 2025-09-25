-- local M = {}
--
-- function M.run_in_new_window()
-- 	local file_path = vim.api.nvim_buf_get_name(0)
-- 	local file_dir = vim.fn.fnamemodify(file_path, ":p:h") -- Get the directory of the current file
--
-- 	local command =
-- 		string.format("tmux new-window 'cd %s && zsh -c \"npm run dev; exec zsh\"'", vim.fn.shellescape(file_dir))
--
-- 	vim.cmd("silent !" .. command)
-- end
--
-- return M

local M = {}

function M.run_in_new_window()
	-- Get the current file's path and directory
	local file_path = vim.api.nvim_buf_get_name(0)
	local file_dir = vim.fn.fnamemodify(file_path, ":p:h")

	-- Define a function to find the root directory of the project
	local function find_project_root(start_dir)
		local current_dir = start_dir
		while current_dir ~= "" do
			if vim.fn.filereadable(vim.fn.join({ current_dir, "package.json" }, "/")) == 1 then
				return current_dir
			end
			local parent_dir = vim.fn.fnamemodify(current_dir, ":h")
			if parent_dir == current_dir then
				return nil
			end
			current_dir = parent_dir
		end
		return nil
	end

	-- Get the root directory of the project
	local project_root = find_project_root(file_dir)
	if not project_root then
		print("Could not determine project root")
		return
	end

	-- Create the tmux command to open a new window, run npm, and create a bottom split
	local command = string.format(
		"tmux new-window 'cd %s && zsh -c \"npm run dev; exec zsh\"' \\; split-window -b -d 'cd %s && zsh' \\; select-pane -t 0",
		vim.fn.shellescape(project_root),
		vim.fn.shellescape(project_root)
	)

	vim.cmd("silent !" .. command)
end

return M
