# Troubleshooting

What to do for the messages you may see with the Desktop MCP.

<a id="check"></a>

## Check the state first

Check that the connection works with the steps in [Check it in the AI tool](install.md#steps). If it does not, look for your message in the table below.

<a id="contact"></a>

## When you contact support

Send these to support@exploratory.io: the version of Exploratory Desktop, the name and version of your AI client, what you did, and the error message as it was shown. Hide any token or API key.

<a id="trouble"></a>

## Troubleshooting

| What you see | What to do |
| --- | --- |
| exploratory-mcp is not found | Start Exploratory Desktop v17 or later with MCP on. The command is added automatically when the app starts. Then restart your AI client. |
| exploratory-mcp is not found from the AI client (macOS) | Exploratory is open from the disk image. Move it to the Applications folder and start it again. The command is added when the app starts. |
| The card shows "Could not install." | Hold the pointer over Details to see the output. Follow the reason shown, then choose Try again. See [Install the plugin](install.md#failure). |
| A marketplace named "exploratory" is already registered from a different source … | Remove it with the command the message shows, then choose Install again. |
| Your organization's settings may not allow this marketplace. | Ask your administrator. |
| A Claude Code hook cannot find node | Install Node.js and add node to your PATH. |
| A gate stops a create call, a limit is reached, or an approval is asked | See [Limits and errors](limits.md). |
| The Desktop MCP does not work as you expect | Check that you are signed in to Exploratory Desktop. |
