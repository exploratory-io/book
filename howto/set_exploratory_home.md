# Change Repository Location

Exploratory creates its repository in .exploratory directory under user's home directory.
The .exploratory directory is created at installation, but we have seen cases where this fails when the home directory includes space character or non-ascii character.
If you are having issue in installation and your home directory name includes space or non-ascii character, setting the repository directory to some other directory without space/non-ascii character may work around the isuue.
By setting EXPLORATORY_HOME environment variable, Exploraotry uses the specified directory as the place for repository instead of .exploratory directory under home directory.

## Steps to set up EXPLORATORY_HOME environment variable on Windows

1. Create a new directory for repository. Let's say we created "C:\exploratory" here as an example.

2. Start typing "environment" into Windows's search box, and you will see search result that says "Edit environment variables for your account". Click to open it.

  ![](images/exploratory_home_win_1.png)

3. "Environment Variables" dialog opens.

  ![](images/exploratory_home_win_2.png)

4. Click "New..." to create a new environment variable.

  ![](images/exploratory_home_win_3.png)

5. Set "EXPLORATORY_HOME" to Variable name, "C:\exploratory" to Variable value. Click "OK".

  ![](images/exploratory_home_win_4.png)

6. As you can see, EXPLORATORY_HOME variable is set.

7. Logout from Windows, and Log back in.

8. Install Exploratory by clicking Exploratory.exe. As Exploratory is installed, it uses "C:\exploratory" directory instead of .exploratory directory under home directory.

## Steps to set up EXPLORATORY_HOME environment variable on Mac

1. Open a shell and create a new directory for repository. Let's say we create "/exploratory" here as an example.
```
sudo mkdir /exploratory
```

2. Set ownership of the directory so that Exploratory run by you can read/write in the directory. Let's say your Mac OS username is john here.
```
sudo chown john /exploratory
```

3. Create `environment.plist` under `~/Library/LaunchAgents/` with the following content. (Replace "/exploratory" with the directory you are using for repository.)
```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>Label</key>
  <string>my.startup</string>
  <key>ProgramArguments</key>
  <array>
    <string>sh</string>
    <string>-c</string>
    <string>
    launchctl setenv EXPLORATORY_HOME /exploratory
    </string>
  </array>
  <key>RunAtLoad</key>
  <true/>
</dict>
</plist>
```

4. Logout and Log back in to your Mac OS. This will enable EXPLORATORY_HOME environment variable we set at the previous step.

5. Start Exploratory, and it will start using /exploratory as the repository.
