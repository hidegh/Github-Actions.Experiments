# Github-Actions.Experiments
This is just a test repository, used to experiment and set up proper **github action** workflows!

**The final build YAML is: .github/workflows/build.yml - which:**
1. check's out master branch
2. **increments the version number** inside: Directory.Build.props (this is the basic setting for all projects)
3. **builds** the project based on the build-list.txt content
4. runs **test** projects defined inside test-list.txt
5. **creates NuGet packages** (but does not upload them yet) - it uses the pack-list.txt
6. fetches GIT status, sets identity, then does a **commit (to save version number changes)** and finally pushes changes to origin
7. now we do **publish the NuGet packages** (again we use the pack-list.txt)
8. finally we do create a TAG for the commit and push that given TAG to origin

**NOTES:**
1. build, test, packaging and publishing could be done via single command, without the need to use custom lists (but this way it's more flexible)
2. inside the Docs folder, there are some powershell script samples (like parsing last TAG)

**Additional notes:**
1. was also experimenting with actions from github marketplace (expecially around tagging) - but usually the trick there is to find the proper one that works both on windows/linux based builds...I just had not that luck and doing it purely via commands was simpler and ended in a more flexible result
