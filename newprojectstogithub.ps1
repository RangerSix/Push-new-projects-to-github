# Variables
$repositoryName = "YourRepositoryName" # Replace with your repository name
$repoPath = "C:\Path\To\Your\Project"  # Replace with the local path to your project
$githubUsername = "YourGitHubUsername" # Replace with your GitHub username
$githubToken = "YourGitHubToken"       # Replace with your GitHub Personal Access Token
$remoteUrl = "https://$githubUsername:$githubToken@github.com/$githubUsername/$repositoryName.git"

# Navigate to your project directory
Set-Location -Path $repoPath

# Initialize a new git repository if it doesn't already exist
if (!(Test-Path "$repoPath\.git")) {
    git init
    Write-Output "Initialized new Git repository."
}

# Add all files to the staging area
git add -A

# Commit the changes
git commit -m "Initial commit"

# Add the remote origin (GitHub repository)
git remote add origin $remoteUrl

# Push to the GitHub repository
git branch -M main
git push -u origin main

Write-Output "Project pushed to GitHub successfully!"