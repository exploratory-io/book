---
title: "Installation"
---

There are two ways to get expl. Pick one; you do not need both.

<a id="choose"></a>

## Choose how to install

> **Server only**
>
> This page is about installing expl to use with Exploratory Server. The copy that comes with Desktop can run expl server too.

| Your situation | How |
| --- | --- |
| You use Exploratory Desktop | It is bundled with Desktop. Nothing else to do. |
| You do not use Desktop (Server only, CI, servers) | Install it with npm. |

<a id="desktop"></a>

## With Exploratory Desktop

expl is bundled with Exploratory Desktop, including expl server. You need no extra installation and no Node.js.

When you start Exploratory Desktop, it puts expl on your PATH (the list of folders where commands are found) if it is not there yet. On macOS this happens only when the app is in /Applications or \~/Applications. It may ask for administrator permission. If you decline, it uses \~/.local/bin; add that folder to your PATH if needed.

An existing command called expl that is not Exploratory's is never replaced.

Open a new terminal and run this.

```sh
expl --version
```

> If the first line reads expl \<version\>, it works.

<a id="npm"></a>

## With npm

Use this when you do not have Desktop: you only use Exploratory Server, or you run expl in CI or on a server. Node.js 20 or later is required; to install it, see [the Node.js website](https://nodejs.org/). npm is the command that comes with Node.js for installing packages.

### Install it

This installs the latest version globally.

```sh
npm install -g @exploratory/cli
```

The package is @exploratory/cli and the command it installs is expl. Do not install a package named just expl: that name belongs to someone else.

### Run it without installing (npx)

With npx you can run expl without installing it. Write the expl command you want after the package name.

```sh
npx -y @exploratory/cli --version
npx -y @exploratory/cli server login
```

<a id="check"></a>

## Check the installation

```sh
expl --version
```

> If the first line reads expl \<version\>, it works.

If you see expl: command not found, open a new terminal and try again.

<a id="two"></a>

## When two copies are installed

If you installed from npm and also use Desktop, check which one runs.

### macOS and Linux

```sh
which -a expl
```

Shows every copy, in the order they run.

### Windows

```sh
where expl
```

The first line of `expl --version` is expl \<version\>. It does not say how expl was installed, so use the paths above to tell the copies apart. If the first path is not the one you expect, put the folder you want first on your PATH, or remove the other copy.

If you have Desktop, you do not need a global npm install. Using npx in CI is fine.

> **When npm install -g stops with EEXIST**
>
> On a Mac where Node.js was installed with the installer from nodejs.org, npm puts commands in /usr/local/bin, the folder Desktop normally uses, so npm install -g stops with EEXIST. Do not run it again with `--force`: that replaces the expl that comes with Desktop. The other way round, if expl from npm is already in /usr/local/bin, Desktop leaves it in place and does not add its own.

<a id="update"></a>

## Update

To update the npm copy to the latest version, run this command and then check the version.

```sh
npm install -g @exploratory/cli
```

```sh
expl --version
```

Replace \<version\> with the version you want. The copy that comes with Desktop is updated when you update Exploratory Desktop.

For what changed in each version, see the [release notes](/en/release-note).

<a id="remove"></a>

## Remove

Remove the npm copy with this command.

```sh
npm uninstall -g @exploratory/cli
```

For the copy that comes with Desktop, follow [Remove](/en/cli/desktop/install#remove) on the Desktop installation page. Check each path first, so that you do not delete another command with the same name. Desktop adds it again at the next start while the app stays in /Applications.

Next, [sign in](/en/cli/server/login), then get your first result in [Get started](/en/cli/server/get-started#steps). To work with Desktop on this computer, see [Use Desktop](/en/cli/desktop).
