<div align="center">
    <img src="preview.png" width="100%" height="100%" alt="bunnyfetch preview">
</div>
<h3 align="center"> Bunnyfetch </h3>

<p align="center">
    This is my personal fork of [elenapan's](https://github.com/elenapan) bunnyfetch.
    Hope you like it
</p>

<br>

## Setup

1. **Dependencies**

    There's not much dependencies, you only need Powershell(which is default shell for windows), Git and Scoop!
    Everything will be installed through the Installation step.

    + Powershell
    + [Git]()
    + [Scoop](https://scoop.sh)

    <br>

2. **Installation**

    Open your terminal, and copy these commands (one by one)

    ```powershell
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
    ```

    ```powershell
    Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression 
    ```

    ```powershell
    scoop install git
    ```

    ```powershell
    git clone https://github.com/ahmadinne/bunnyfetch
    ```

    ```powershell
    cd bunnyfetch
    ```

    ```powershell
    .\install.ps1
    ```

    <br>
