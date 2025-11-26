# Comprehensive Data Wrangling for STEM Student Performance Research

Welcome to the repository! This guide will help you get started with using Git, GitHub, and RStudio for collaborating on our project. For more detailed instructions, you can refer to [Happy Git with R](https://happygitwithr.com/).

## What is Git and GitHub?

**Git**: A version control system that helps you track changes and collaborate with your team. It is a collection of individual commands you execute in the shell.

**Repository**: A set of files stored by a provider. GitHub is a repository hosting service for your Git-based projects online, allowing others access to your project in nearly real time.

## Initial Setup

### Step 1: Register a GitHub Account

- Go to [GitHub](https://github.com) and register for a free account.
- Choose a username that is short, professional, memorable, timeless, all lower case, and uses hyphens to separate words.

### Step 2: Install or Upgrade R and RStudio

- Download and install the latest version of R and RStudio from [Posit](https://posit.co/download/rstudio-desktop/).

### Step 3: Install Git

- **Windows**: Install Git Bash from [Git for Windows](https://gitforwindows.org/). Accept the defaults during installation.
  - Ensure Git is installed at `C:/Program Files/Git/bin/git.exe`.

- **Linux**: Use your distribution’s package manager.
  - Ubuntu/Debian: `sudo apt-get install git`
  - Fedora/RedHat: `sudo yum install git`
  - Alternatively, download from [Git SCM](https://git-scm.com/download/linux).

- **macOS**: Install Xcode command line tools.
  - In Terminal, run: `git --version` or `git config` and follow the prompts to install.

### Step 4: Introduce Yourself to Git

•	Open the shell (Terminal on macOS, Git Bash on Windows) and run:

```sh
git config --global user.name "Your Name"
git config --global user.email example@boisestate.edu
```
•	Use the email associated with your GitHub account.
Verify your settings:
```sh
git config --global –list
```
•	Set the initial default branch to main:
```sh
git config --global init.defaultBranch main
```

### Step 5: Set Up SSH Keys

SSH keys provide better security. To generate SSH keys, run:
```sh
ssh-keygen -t rsa -b 4096
```
Follow the prompts to create your keys. By default, they’ll be saved in ~/.ssh/id_rsa (private key) and ~/.ssh/id_rsa.pub (public key).
Add your public key to GitHub:
1.	Go to GitHub > Settings > SSH and GPG keys.
2.	Click “New SSH key”.
3.	Copy the public key from ~/.ssh/id_rsa.pub and paste it into the key field.
4.	Give your device a title.
Test the connection:
```sh
ssh -T git@github.com
```

### Step 6: Connect Git and GitHub

#### 6.1 Create a Repository on GitHub

1.	Go to GitHub and log in.
2.	Click the “New” button near “Repositories”.
3.	Fill in the repository details:
o	Repository template: No template
o	Repository name: myrepo
o	Description: “My first repo”
o	Public
o	Initialize with a README file
4.	Click “Create repository”.

#### 6.2 Clone the Repository in Shell

```sh
git clone https://github.com/YOUR-USERNAME/YOUR-REPOSITORY.git
cd myrepo
ls
head README.md
git remote show origin
```
#### 6.3 Make a Local Change and Push to GitHub

1.	Add a line to README.md:
```sh
echo "A line I wrote on my local computer" >> README.md
git status
```
2.	Commit and push to GitHub:
```sh
git add README.md
git commit -m "A commit from my local computer"
git push
```

### Step 7: Connect RStudio to GitHub

#### 7.1 Create a Repository on GitHub

1.	Go to GitHub and log in.
2.	Click the “New” button near “Repositories”.
3.	Fill in the repository details:
o	Repository template: No template
o	Repository name: myrepo
o	Description: “My second repo”
o	Public
o	Initialize with a README file
4.	Click “Create repository”.

#### 7.2 Clone the Repository in RStudio

1.	Open RStudio.
2.	Go to File > New Project > Version Control > Git.
3.	Paste the repository URL from GitHub.
4.	Accept the default (project name and GitHub repo name must match).
5.	Pay attention to where you save your project locally.
6.	Open the project in a new session.
7.	Notice the README.md file on your computer.

#### 7.3 Make a Local Change in RStudio

1.	Open README.md in RStudio.
2.	Add a line to README.md:  “A line I wrote in RStudio”
3.	Commit and push the changes:
o	Click the Git tab.
o	Check the “Staged” box for README.md.
o	Click Commit.
o	Type the message “Commit from R”.
o	Click Commit.
o	Push the changes.
o	Confirm in GitHub.
You are now set up to use Git and GitHub with RStudio for our project.

### Step 8: Connect **this** Repository to a RStudio Project

To collaborate effectively on this repository, follow these steps to connect the repository to your RStudio project.

#### 8.1 Clone the Repository to Your Local Machine

1. **Go to the GitHub Repository**: Navigate to the GitHub page of this repository.
2. **Clone the Repository**:
   - Click the green "Code" button.
   - Select "HTTPS" or "SSH" (SSH is preferred for better security).
   - Copy the repository URL.

3. **Open RStudio**: Start RStudio on your local machine.

4. **Create a New Project**:
   - Go to `File` > `New Project` > `Version Control` > `Git`.
   - Paste the copied repository URL into the "Repository URL" field.
   - Choose a local directory to store the repository.
   - Click "Create Project".

#### 8.2 Verify the Repository

1. **Check the Files**: Ensure that all files from the repository are present in your RStudio project. You should see the `README.md` file and other project files.

2. **Open the Project**: You are now working within the cloned repository in RStudio. Any changes you make here can be tracked and pushed back to GitHub.

#### 8.3 Pull the Latest Changes

1. **Fetch and Pull**:
   - Go to the `Git` tab in RStudio.
   - Click the blue "Pull" button to fetch and merge the latest changes from the GitHub repository.
   - Resolve any merge conflicts if they arise.

#### 8.4 Make Local Changes and Commit

1. **Edit Files**: Make any necessary changes to the project files in RStudio.
2. **Save Changes**: Save your changes in RStudio.

3. **Commit Changes**:
   - Go to the `Git` tab.
   - Stage the files you have changed by checking the boxes next to the file names.
   - Click the "Commit" button.
   - Write a meaningful commit message describing the changes.
   - Click "Commit".

#### 8.5 Push Changes to GitHub

1. **Push Changes**:
   - After committing your changes, click the green "Push" button in the `Git` tab.
   - This will push your committed changes to the GitHub repository.

2. **Verify Changes**: Go to the GitHub repository page and verify that your changes have been pushed successfully.

#### 8.6 Collaborate with the Team
1. **Regularly Pull Updates**: Frequently pull the latest changes from the GitHub repository to ensure your local copy is up to date.
2. **Commit Often**: Make regular commits to track your progress and changes.
3. **Communicate**: Use commit messages and GitHub issues to communicate with your team about changes and tasks.
By following these steps, you can effectively collaborate with our team using GitHub and RStudio. 

