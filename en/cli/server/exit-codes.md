---
title: "Exit codes and errors"
---

expl returns an exit code when it ends. Scripts and CI can use the number to judge the result.

<a id="codes"></a>

## The exit codes

| Code | Meaning |
| --- | --- |
| 0 | Success |
| 1 | The operation failed. With Desktop, this also covers a declined confirmation, a timeout, and an approval request that was not answered within 2 minutes (PAIRING_PENDING). With Server, it also covers an error the server returns for the operation, such as NOT_FOUND or DATA_EGRESS_LIMIT. |
| 2 | Wrong usage: an unknown flag, unreadable JSON, a missing `--yes` outside a terminal, and so on. |
| 3 | Desktop or Server cannot be reached. For Server: the network, an HTML error page and so on. |
| 4 | Authentication, approval or permission. For Desktop: not signed in, the connection not approved, the CLI turned off, or the operation not allowed. For Server: not signed in, or the token or API key was rejected (wrong, expired, revoked, or blocked by an administrator). |
| 130 | Interrupted with Ctrl+C |

A reader closing the pipe (expl ... | head -1) is not an error and exits with 0.

<a id="action"></a>

## When you see 3 or 4

| Code | What to do |
| --- | --- |
| 3 | With Desktop, start Exploratory Desktop and run it again. With Server, check the network and run it again. |
| 4 | With Desktop, the code in parentheses at the end of the message tells which case it is (see the table below). With Server, run expl server login. With an API key, create a new key in Account Settings \> API Keys if it is wrong, expired or revoked, or ask your administrator when the message says API keys are disabled or the IP address is not allowed. To switch to a saved login while EXPL_SERVER_TOKEN is set, run unset EXPL_SERVER_TOKEN first, because it is used before a saved login. |

The code at the end of an exit code 4 message tells what to do.

| Code in the message | What to do |
| --- | --- |
| NOT_LOGGED_IN | Server only. Run expl server login. |
| NOT_SIGNED_IN | Sign in to Exploratory Desktop. |
| UNAUTHORIZED | Desktop: run the command again. Exploratory Desktop asks you to approve the connection; see [Get started](/en/cli/desktop/get-started#steps) for Desktop. Server: the API key was refused (wrong, expired or revoked). Create a new key in Account Settings \> API Keys, then set EXPL_SERVER_TOKEN or run `expl server login --with-token`. |
| PAIRING_REQUIRED | This connection was declined on the approval screen of Exploratory Desktop (this code is also used when too many approval requests are made in a short time). For 5 minutes after you decline, running the command again does not show the screen and is declined at once. Run it again after 5 minutes and allow it on the screen. |
| CHANNEL_DISABLED | Desktop: in System Settings > MCP / CLI, turn on the switch on the CLI card and choose Save. Server: the publisher turned off MCP access for this content. Ask the publisher to check the MCP access setting of the content. |
| PERMISSION_DENIED | Desktop: this connection is not allowed to perform that operation. For an operation that creates, changes or deletes content, check that Allow create, edit and delete is turned on in System Settings > MCP / CLI. Server: an administrator turned API keys off or limits them to certain IP addresses. Ask your administrator, or sign in with expl server login. |

To find a fix by symptom, see [Troubleshooting](/en/cli/server/troubleshooting).
