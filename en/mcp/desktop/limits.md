---
title: "Limits and errors"
---

What the Desktop MCP refuses or stops, and what to do about it. Settings that decide these limits are in [Permissions and settings](/en/mcp/desktop/permissions).

<a id="limits"></a>

## Limits

| What you see | What to do |
| --- | --- |
| Desktop shows an approval prompt before a delete, publish, R code run, AI processing or similar | This is the confirmation. Approve it in Desktop. To stop being asked, turn on the matching setting under System Settings \> MCP / CLI. See [What you control in Desktop](/en/mcp/desktop/permissions#control) |
| Desktop asks you to approve a new app | An app asks the first time it connects. Approve it in Desktop. Removing an app under Approved apps makes it ask again. After you choose Don't allow, the same app is refused for 5 minutes without the window appearing again |
| A call says that MCP is turned off | Turn on the MCP switch in System Settings \> MCP / CLI, then choose Save at the bottom |
| A create or change call is refused with PERMISSION_DENIED | Allow create, edit and delete is off. Turn it on in System Settings \> MCP / CLI, then choose Save at the bottom. Reading still works without it |
| The Desktop MCP tools return a not-running error | Start Exploratory Desktop. Then use the tools again in the same conversation |

<a id="gates"></a>

## Plugin checks (Claude Code)

A hook of the Exploratory Desktop plugin can stop a tool call. The AI can follow the message, fix it and continue. For the plugin settings, see [Permissions and settings](/en/mcp/desktop/permissions#plugin-settings).

| What you see | What to do |
| --- | --- |
| `get_dashboard_image and get_note_image are only for when the user asks for an image. ...` | The image tools (get_note_image, get_dashboard_image) work only when your message asks for an image. The AI reads values with get_chart_data or get_dashboard instead. When you need an image, ask for an image or a screenshot in your message. With `review_hook` on, this check does not stop the call. |
| `カスタム R の関所: exp_custom の式は 表 %>% 式 として実行されます。...` (custom R gate: wrong opening form) | Only with `review_hook` on. The custom R command starts in a wrong form. The AI rewrites it to start with a verb such as mutate(...) or filter(...). |
| `カスタム R の関所: この式の ... で作れます。...` (custom R gate: a product command can do this) | Only with `review_hook` on. The custom R command does what a product command can do. The AI rebuilds it with the product command. It stops at most 2 times in a session. |
| `全体画像（get_note_image / get_dashboard_image）で見ていないチャートが ... 枚あります` (whole-image check) | Only with `review_hook` on. Before the final report, the AI is asked to look at the whole image of the note or dashboard once and compare it with the original artifact. |
