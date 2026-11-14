# Quickstart

Start Desktop, then check its state with expl, choose a project and get a dashboard.

<a id="steps"></a>

## Seven steps

### 1. Start Desktop

Start Exploratory Desktop.

### 2. Sign in to Desktop

Sign in to Exploratory Desktop. expl reads the connection details and token that Desktop writes, so expl has no sign-in of its own.

### 3. Check the state

```sh
expl status
```

It shows the Desktop version and the signed-in user.

### 4. Allow the connection the first time

The first time you use it, Exploratory Desktop shows a screen that asks whether to allow expl to connect to Exploratory. Check that it is the expl you started yourself, and allow it. After you allow it, run expl status again.

### 5. List the projects

```sh
expl project list
```

### 6. Choose a project

```sh
expl project use "Sales Analysis"
```

Replace Sales Analysis with the name of your project.

### 7. Get a dashboard

```sh
expl dashboard get d123 --json
```

Replace d123 with the id of a dashboard.

If something fails, see the troubleshooting page.

<a id="next"></a>

## Next

- [Choose a project](guides/projects.md) - The order in which the project is decided.
- [Common commands](commands.md) - Find a command by purpose.
- [Troubleshooting](troubleshooting.md) - Find a fix by symptom.
