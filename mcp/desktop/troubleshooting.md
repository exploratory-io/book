# Troubleshooting (Desktop)

What to do for the messages you may see with the Desktop MCP.

<a id="trouble"></a>

## Troubleshooting

| What you see | What to do |
| --- | --- |
| exploratory-mcp is not found | Start Exploratory Desktop v17 or later with MCP on. The command is added automatically when the app starts. Then restart your AI client. |
| exploratory-mcp is not found from the AI client (macOS) | Exploratory is open from the disk image. Move it to the Applications folder and start it again. The command is added when the app starts. |
| The Desktop MCP tools return a not-running error | Start Exploratory Desktop. Then use the tools again in the same conversation. |
| A call says that MCP is turned off | Turn on the MCP switch in System Settings \> MCP / CLI. Then choose Save at the bottom of System Settings. |
| The card shows "Could not install." | Hold the pointer over Details to see the output. Follow the reason shown, then choose Try again. See [Install the plugin](install.md#failure). |
| Git was not found on this computer. Install Git and try again. | The Antigravity install fetches the plugin with Git. Install Git and try again. |
| A marketplace named "exploratory" is already registered from a different source … | Remove it with the command the message shows, then choose Install again. |
| Your organization's settings may not allow this marketplace. | Ask your administrator. |
| A Claude Code hook cannot find node | Install Node.js and add node to your PATH. |
| The Desktop MCP does not work as you expect | Check that you are signed in to Exploratory Desktop. |
