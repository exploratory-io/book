# How to change directory for user data

Exploratory stores user data in .exploratory directory under user's home directory.
The .exploratory directory is created at installation, but we have seen cases where this fails when the home directory includes space character or non-ascii character.
If you are having issue in installation and your home directory name includes space or non-ascii character, setting the user data directory to some other directory without space/non-ascii character may work around the isuue.
By setting EXPLORATORY_HOME environment variable, Exploraotry uses the specified directory as the place to store user data instead of .exploratory directory under home directory.

## Steps to set up EXPLORATORY_HOME environment variable

1. Create a new directory for Exploratory user data. Let's say we created "C:\exploratory" here as an example.

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
