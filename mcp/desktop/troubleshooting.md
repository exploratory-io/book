# Troubleshooting (Desktop)

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
| The Desktop MCP tools return a not-running error | Start Exploratory Desktop. Then use the tools again in the same conversation. |
| A call says that MCP is turned off | Turn on the MCP switch in System Settings \> MCP / CLI. Then choose Save at the bottom of System Settings. |
| The card shows "Could not install." | Hold the pointer over Details to see the output. Follow the reason shown, then choose Try again. See [Install the plugin](install.md#failure). |
| A marketplace named "exploratory" is already registered from a different source … | Remove it with the command the message shows, then choose Install again. |
| Your organization's settings may not allow this marketplace. | Ask your administrator. |
| A Claude Code hook cannot find node | Install Node.js and add node to your PATH. |
| `計画の関所: R の作業の後は、先にシナリオ（<題名>_シナリオ.md）と計画（<題名>_Exploratory作成計画.md）を保存してください。` | The plan gate stopped a create call because the AI used the exploratory-analysis skill and did R work first. Ask the AI to save the scenario and the creation plan that the message names, then continue. To turn the check off, set `plan_gate` to `"false"`. See [Plugin settings](limits.md#plugin-settings). |
| `計画の関所: この計画は記録されません。計画に、実在する HTML のファイル名が書かれていません。` | An HTML report was saved, but the plan does not name it. Write the file name of the saved HTML in the plan, and save the plan again. |
| `ノートの関所: 次の分析の出力をノートの本文に {{analytics:ID\|出力}} で入れてから作り直してください。` | The note gate stopped creating or replacing a note. A predictive model or clustering made in this session has outputs that the note body does not embed. Ask the AI to add the outputs the message lists, then create the note again. The gate stops at most twice. |
| The Desktop MCP does not work as you expect | Check that you are signed in to Exploratory Desktop. |
