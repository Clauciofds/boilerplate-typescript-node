[Portuguese version](https://github.com/Clauciofds/boilerplate-typescript-node/edit/main/README.md)
  # Script para criação de novos projetos Type Script Node:
![watchers](https://img.shields.io/github/watchers/Clauciofds/boilerplate-typescript-node.svg)
![forks](https://img.shields.io/github/forks/Clauciofds/boilerplate-typescript-node.svg)
![commits](https://img.shields.io/github/stars/Clauciofds/boilerplate-typescript-node.svg)  
**TypeScript Node Project Creation Script**

This batch script (.bat file) is used to automate the creation of a new TypeScript project in Visual Studio Code (VS Code). I will explain each part:

**ippD.bat File**

-> @echo off: Disables the display of commands in the terminal. This means that subsequent commands will not be shown on the screen during execution.

-> echo Creates new project?: Displays the message "Creates new project?" in the terminal. The user will see this message and can respond.

-> pause: Pauses the execution of the script until the user presses a key. This allows the user to read the previous message before continuing.

-> npm init -y: Initializes a new Node.js project with the default settings. The -y parameter indicates that interactive questions should be answered automatically with "yes".

-> npm i -D typescript ts-node: Installs the typescript and ts-node dependencies as development dependencies (-D). TypeScript is a superset language of JavaScript, and ts-node allows you to run TypeScript files directly in Node.js.

-> npx tsc --init: Initializes a TypeScript configuration file (tsconfig.json) in the project. This file defines the compilation options for TypeScript.

**codj.bat File**

--> codj:

-> The codj.bat script is a Windows batch script that performs the following sequence of operations:

1. Disables the display of commands with the @echo off command.

2. Enables delayed variable expansion with setlocal enabledelayedexpansion, which allows the use of variables within code blocks (such as loops).

3. Sets the TSConfig variable to the name of the configuration file and TempFile to the name of a temporary file.

4. Initializes the LineNumber variable to zero, which will be used to track the current line number while reading the file.

5. Starts a loop to read each line of the tsconfig.json file.

6. Increments the LineNumber variable with each iteration of the loop.

7. Checks if the current line is the 12th or 53rd line and, if so, modifies the content of the line:

   - On line 12, changes the option "target": "es2016"(1) to "target": "ES2020".

   - On line 53, changes the option "outDir": "./" to "outDir": "./javascript".

   Note: (1)

   Here is some relevant information about the "target":

   Possible Values: The "target" can be configured with the following values:

    "ES3": Generates JavaScript code compatible with ECMAScript 3 (ES3).

    "ES5": Generates JavaScript code compatible with ECMAScript 5 (ES5).

    "ES6" or "ES2015": Generates JavaScript code compatible with ECMAScript 2015 (ES6).

    "ES2016": Generates JavaScript code compatible with ECMAScript 2016 (ES7).

    "ES2017": Generates JavaScript code compatible with ECMAScript 2017 (ES8).

    "ESNext": Generates JavaScript code compatible with the latest version of ECMAScript (ESNext).

   Benefits of Using Versions Later than ES2015:

    By using a newer version of ECMAScript (such as ES2016), you can benefit from:

    - Smaller Bundles: The generated code may be more compact, especially if you are using features specific to newer versions.

    - Native Features: Less need for polyfills, as modern browsers support more features natively.

    - Better Performance: Some newer features may be optimized for performance.

    º However, keep in mind that if you target newer versions, older browsers may encounter runtime errors if they use features not supported by their specific version.

8. Redirects the modified output to a temporary file.

9. Moves the temporary file to the original tsconfig.json file with the command move /y %TempFile% %TSConfig%.

10. Displays a message informing that the change was completed successfully.

Essentially, the script modifies the tsconfig.json file to change the TypeScript target version to ES2020 and the output directory to a folder called javascript. After execution, the original tsconfig.json file is updated with these changes.

**How to make it work in PowerShell and Command Prompt**

**Step 1**

Create a folder in a location of your choice and place the ippD.bat and codj.bat files inside it.

## Step 2: Adding the Script Path to the PATH Environment Variable

**Windows PowerShell/command prompt**

1. **Note the Path:** Make a note of the path to the folder where you saved the .bat files.

2. **Set the PATH Variable:** Use the following command to add the script folder path to the PATH environment variable:

   ```powershell
   setx PATH %PATH%;C:\Path\To\Your\Script\Folder\"
   ```

   Replace `C:\Path\To\Your\Script\Folder` with the actual path to the folder where you saved the .bat files.

3. **Verify the PATH Update:** To check if the path was added successfully, use the following command:

   ```powershell
   $env:PATH
   ```

   This will display the current PATH environment variable, which should now include the path to your script folder.

**Git Bash**

1. **Open Git Bash:** Launch the Git Bash terminal.

2. **Edit .bashrc:** Use the following command to open the .bashrc file for editing:

   ```bash
   nano ~/.bashrc
   ```

   Note: This will open the .bashrc file in the nano text editor.

3. **Add Path to .bashrc:** Inside the .bashrc file, add the following line to export the path to your script folder to the PATH variable:

   ```bash
   export PATH="$PATH:/path/to/your/script"
   ```

   Replace `/path/to/your/script` with the actual path to the folder where you saved the .bat files.

4. **Save and Exit nano:** Press `Ctrl + O` to save the changes, then press `Enter` to confirm. Next, press `Ctrl + X` to exit the nano editor.

5. **Reload .bashrc:** To apply the changes made to .bashrc, execute the following command:

   ```bash
   source ~/.bashrc
   ```

   This will reload the .bashrc file and update the PATH environment variable accordingly.

**Additional Notes:**

* In Git Bash on Windows 11, you might still need to type the `.bat` extension when executing the script, even after adding the path to .bashrc.

* To avoid typing the extension, you can open a Windows Command Prompt within Git Bash by typing the following command:

   ```bash
   cmd
   ```

   Once the Command Prompt opens, you can execute the script without the extension, e.g.:

   ```
   ippd
   ```

   After the TypeScript project creation is complete, use the `exit` command to exit the Command Prompt.

Now your script should be accessible in both PowerShell and Git Bash by simply typing its name (without the extension) in the respective terminal.
