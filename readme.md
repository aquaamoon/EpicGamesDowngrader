<h1 align="center">Epic Games Downgrader</h1>

<p align="center">
  Forked from <a href="https://github.com/whichtwix/EpicGamesDowngrader">@whichtwix's EpicGamesDowngrader</a>.
</p>

---

This repository contains a PowerShell script that allows **Epic Games players** to install a specific version of **Among Us** when an older version is required for mod compatibility.

The script uses the third-party tool [**Legendary**](https://github.com/derrod/legendary) to download and install Among Us through Epic Games.

---

## Usage

**1.** Download **`DowngradeEpic.ps1`** and keep it in your Downloads folder.

**2.** Right-click the file and select **Run with PowerShell**.

**3.** Follow the prompts provided by **Legendary** to authenticate your Epic Games account.

**4.** Once the script has finished, follow the instructions provided to launch Among Us using **EpicGamesStarter**.

> [!WARNING]
> Do **not** run the script as Administrator. The script must be run as a normal Windows user.

---

## Common Issues & Troubleshooting

<details>
<summary><b>EpicGamesStarter was not downloaded or does not work.</b></summary>

<br>

**Solutions:**

* Download the latest `EpicGamesStarter.exe` from the [EpicGamesStarter releases](https://github.com/whichtwix/EpicGamesStarter/releases/latest).
* If EpicGamesStarter still does not work, download the `.cmd` file from the releases page.
* Place the `.cmd` file in the same folder as `Legendary.exe` and use it to launch the game.

</details>

<details>
<summary><b>PowerShell instantly closes.</b></summary>

<br>

**Solutions:**

1. Open **PowerShell** manually.

2. Navigate to your Downloads folder:

   ```powershell
   cd Downloads
   ```

3. Allow scripts to run for the current PowerShell session:

   ```powershell
   Set-ExecutionPolicy Unrestricted -Scope Process
   ```

4. Run the script:

   ```powershell
   .\DowngradeEpic.ps1
   ```

Running the script this way will keep the PowerShell window open so that any error messages can be seen.

</details>

<details>
<summary><b>"curl (35) schannel: next InitializeSecurityContext failed" or similar.</b></summary>

<br>

This error is commonly caused by antivirus or security software blocking the downgrader or one of the files it is attempting to download.

**Solution:**

1. Download the **DowngradeEpic.ps1** and keep it in your Downloads folder.
2. Open PowerShell and enter the following
   
   ```text
   cd downloads
   ```

      ```text
   Set-ExecutionPolicy Unrestricted -Scope Process
   ```

      ```text
   .\DowngradeEpic.ps1
   ```
3. It will ask if you want to run the script. Type **R** and enter. The downgrade process should then run and open a downgraded version in ```C:\Users\YOURNAME\Games\AmongUs```.
</details>


<details>
<summary><b>"Access to the path '&lt;&gt;' is denied" / "No write access to '&lt;&gt;'".</b></summary>

<br>

**Solutions:**

* If the error mentions **`Legendary.exe`**, Legendary may not have downloaded correctly. Download it manually from the [Legendary releases](https://github.com/derrod/legendary/releases/latest) and place it in the same folder as the PowerShell script.

* If the error mentions the folder where Among Us is being installed:

  * Open `Legendary.exe` from the folder containing the script.
  * Run:

     ```text
     legendary uninstall 963137e4c29d4c79a81323b8fab03a40 --keep-files
     ```

  * Close Legendary.
  * Run the PowerShell script again.

</details>

<details>
<summary><b>"Invalid credentials, Please login again" or similar.</b></summary>

<br>

**Solutions:**

1. Open `Legendary.exe` from the folder containing the script.

2. Run:

   ```text
   legendary auth --delete
   ```

3. Authenticate again:

   ```text
   legendary auth
   ```

4. Once authentication is complete, run the PowerShell script again.

</details>

<details>
<summary><b>"The game 963137e4c29d4c79a81323b8fab03a40 could not be found, did you spell it correctly?"</b></summary>

<br>

This usually means that the Epic Games account currently authenticated with Legendary does not have Among Us in its library.

This can happen if you have multiple Epic Games accounts.

**Solution:**

1. Follow the authentication steps above.
2. Log in to the Epic Games account that owns Among Us.
3. Run the PowerShell script again.

</details>

---

## Need Help?

> [!TIP]
> If you're having problems with the downgrader or need help getting your mod working, please join the [Town of Us Discord](https://discord.gg/ugyc4EVUYZ) and make a support ticket!

---

## Credits

* **[whichtwix](https://github.com/whichtwix)** — Original EpicGamesDowngrader.
* **[EpicGamesStarter](https://github.com/whichtwix/EpicGamesStarter)** — Used to launch the Epic Games installation.
* **[Legendary](https://github.com/derrod/legendary)** — Epic Games launcher used to download the game.
