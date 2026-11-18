---
title: "Limits and errors"
---

What the Desktop MCP refuses or stops, and what to do about it. Settings that decide these limits are in [Permissions and settings](/en/mcp/desktop/permissions).

<a id="limits"></a>

## Limits

| What you see | What to do |
| --- | --- |
| A request for more data than the level you chose is refused | Desktop shares only up to the level set in System Settings \> MCP / CLI (names, columns and data types only, aggregated results, sample rows up to 100, or all rows). Ask for a smaller result, or raise the level. See [What you control in Desktop](/en/mcp/desktop/permissions#control) |
| Desktop shows an approval prompt before a delete, publish, R code run, AI processing or similar | This is the confirmation. Approve it in Desktop. To stop being asked, turn on the matching setting under System Settings \> MCP / CLI. See [What you control in Desktop](/en/mcp/desktop/permissions#control) |
| Desktop asks you to approve a new app | An app asks the first time it connects. Approve it in Desktop. Removing an app under Approved apps makes it ask again. After you choose Don't allow, the same app is refused for 5 minutes without the window appearing again |
| A call says that MCP is turned off | Turn on the MCP switch in System Settings \> MCP / CLI, then choose Save at the bottom |
| A create or change call is refused with PERMISSION_DENIED | Allow create, edit and delete is off. Turn it on in System Settings \> MCP / CLI, then choose Save at the bottom. Reading still works without it |
| The Desktop MCP tools return a not-running error | Start Exploratory Desktop. Then use the tools again in the same conversation |

<a id="gates"></a>

## Gate stops

A gate stops a create call until a condition is met. The AI can then fix it and continue.

| What you see | What to do |
| --- | --- |
| `計画の関所: R の作業の後は、先にシナリオ（<題名>_シナリオ.md）と計画（<題名>_Exploratory作成計画.md）を保存してください。` | The plan gate stopped a create call because the AI used the exploratory-analysis skill and did R work first. Ask the AI to save the scenario and the creation plan that the message names, then continue. To turn the check off, set `plan_gate` to `"false"`. See [Plugin settings](/en/mcp/desktop/permissions#plugin-settings). |
| `計画の関所: この計画は記録されません。計画に、実在する HTML のファイル名が書かれていません。` | An HTML report was saved, but the plan does not name it. Write the file name of the saved HTML in the plan, and save the plan again. |
| `ノートの関所: 次の分析の出力をノートの本文に {{analytics:ID\|出力}} で入れてから作り直してください。` | The note gate stopped creating or replacing a note. A predictive model or clustering made in this session has outputs that the note body does not embed. Ask the AI to add the outputs the message lists, then create the note again. The gate stops at most twice. |
