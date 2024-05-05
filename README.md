---------------------------------------------------------------------------------------------------------------
//Generowanie klucza SSH
anastasiia@DESKTOP-3HKTLS0 MINGW64 ~
$ ssh-keygen -t ed25519 -C "an.p.github@gmail.com"
Generating public/private ed25519 key pair.
Enter file in which to save the key (/c/Users/anastasiia/.ssh/id_ed25519): /c/Users/anastasiia/.ssh/gh_cli_w_ed25519
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in /c/Users/anastasiia/.ssh/gh_cli_w_ed25519
Your public key has been saved in /c/Users/anastasiia/.ssh/gh_cli_w_ed25519.pub
The key fingerprint is:
SHA256:o4qAfuJxvGiOBNF0khYfFjaNe74NDPWmg7TCsTJaNmY an.p.github@gmail.com
The key's randomart image is:
+--[ED25519 256]--+
|  +oB+           |
| oo*.oo          |
|... .o .         |
| .. + . o        |
|.. + B oS        |
|= E o *. .       |
|+X =  .=         |
|=++o... .        |
|==+..            |
+----[SHA256]-----+

-----------------------------------------------------------------------------------------------------------------
//Sprawdzenie zawartości katalogu .ssh
anastasiia@DESKTOP-3HKTLS0 MINGW64 ~
$ ls -al ~/.ssh
total 42
drwxr-xr-x 1 anastasiia 197121   0 May  5 15:20 ./
drwxr-xr-x 1 anastasiia 197121   0 May  3 16:58 ../
-rw-r--r-- 1 anastasiia 197121 464 Apr 27 16:46 gh_cli_umac_ed25519
-rw-r--r-- 1 anastasiia 197121 103 Apr 27 16:46 gh_cli_umac_ed25519.pub
-rw-r--r-- 1 anastasiia 197121 464 May  5 15:20 gh_cli_w_ed25519
-rw-r--r-- 1 anastasiia 197121 103 May  5 15:20 gh_cli_w_ed25519.pub
-rw-r--r-- 1 anastasiia 197121 411 Apr 30 14:43 id_ed25519
-rw-r--r-- 1 anastasiia 197121 103 Apr 30 14:43 id_ed25519.pub

-----------------------------------------------------------------------------------------------------------------
//Uruchomienie agenta SSH
anastasiia@DESKTOP-3HKTLS0 MINGW64 ~
$ eval "$(ssh-agent -s)"
Agent pid 305

-----------------------------------------------------------------------------------------------------------------
//Dodanie klucza do agenta SSH
anastasiia@DESKTOP-3HKTLS0 MINGW64 ~
$ ssh-add ~/.ssh/gh_cli_w_ed25519
Enter passphrase for /c/Users/anastasiia/.ssh/gh_cli_w_ed25519:
Identity added: /c/Users/anastasiia/.ssh/gh_cli_w_ed25519 (an.p.github@gmail.com)

-----------------------------------------------------------------------------------------------------------------
//Wyświetlenie klucza publicznego
anastasiia@DESKTOP-3HKTLS0 MINGW64 ~
$ cat ~/.ssh/gh_cli_w_ed25519.pub
ssh-ed25519 blablabla an.p.github@gmail.com

-----------------------------------------------------------------------------------------------------------------
//Autoryzacja w GitHub CLI
PS C:\Users\anastasiia> gh auth login
? What account do you want to log into? GitHub.com
? What is your preferred protocol for Git operations on this host? SSH
? Upload your SSH public key to your GitHub account? C:\Users\anastasiia\.ssh\gh_cli_w_ed25519.pub
? Title for your SSH key: (GitHub CLI) GitHub CLI

? Title for your SSH key: GitHub CLI
? How would you like to authenticate GitHub CLI? Paste an authentication token
Tip: you can generate a Personal Access Token here https://github.com/settings/tokens
The minimum required scopes are 'repo', 'read:org', 'admin:public_key'.
? Paste your authentication token: ****************************************
- gh config set -h github.com git_protocol ssh
✓ Configured git protocol
✓ SSH key already existed on your GitHub account: C:\Users\anastasiia\.ssh\gh_cli_w_ed25519.pub
✓ Logged in as nastkap
! You were already logged in to this account
PS C:\Users\anastasiia>

-----------------------------------------------------------------------------------------------------------------
//Status autoryzacji
PS C:\Users\anastasiia> gh auth status
github.com
  ✓ Logged in to github.com account nastkap (keyring)
  - Active account: true
  - Git operations protocol: ssh
  - Token: ghp_************************************
  - Token scopes: 'admin:enterprise', 'admin:gpg_key', 'admin:org', 'admin:org_hook', 'admin:public_key', 'admin:repo_hook', 'admin:ssh_signing_key', 'audit_log', 'codespace', 'copilot', 'delete:packages', 'delete_repo', 'gist', 'notifications', 'project', 'repo', 'user', 'workflow', 'write:discussion', 'write:packages'


-----------------------------------------------------------------------------------------------------------------
Tworzenie nowego repozytorium
C:\Users\anastasiia>gh repo create
? What would you like to do? Create a new repository on GitHub from scratch
? Repository name pawcho6

? Repository name pawcho6
? Description Repo utwzorzone na spr nr.6

? Description Repo utwzorzone na spr nr.6
? Visibility Public
? Would you like to add a README file? Yes
? Would you like to add a .gitignore? Yes
? Choose a .gitignore template Erlang
? Would you like to add a license? Yes
? Choose a license GNU General Public License v3.0
? This will create "pawcho6" as a public repository on GitHub. Continue? Yes
✓ Created repository nastkap/pawcho6 on GitHub
  https://github.com/nastkap/pawcho6
? Clone the new repository locally? No

-----------------------------------------------------------------------------------------------------------------
//Klonowanie repozytorium 
C:\Users\anastasiia>git clone https://github.com/nastkap/pawc
ho6.git
Cloning into 'pawcho6'...
remote: Enumerating objects: 5, done.
remote: Counting objects: 100% (5/5), done.
remote: Compressing objects: 100% (4/4), done.
remote: Total 5 (delta 0), reused 0 (delta 0), pack-reused 0
Receiving objects: 100% (5/5), 12.91 KiB | 6.46 MiB/s, done.

-----------------------------------------------------------------------------------------------------------------
//Kopiowanie plików ,pliki i katalogi z lokalnego katalogu C:\Users\anastasiia\PAwChO_lab5 są kopiowane do katalogu C:\Users\anastasiia\pawcho6\PAwChO_lab5
C:\Users\anastasiia>robocopy C:\Users\anastasiia\PAwChO_lab5 C:\Users\anastasiia\pawcho6\PAwChO_lab5 /E

-------------------------------------------------------------------------------
   ROBOCOPY     ::     Robust File Copy for Windows
-------------------------------------------------------------------------------

  Started : Sunday, May 5, 2024 9:15:54 PM
   Source : C:\Users\anastasiia\PAwChO_lab5\
     Dest : C:\Users\anastasiia\pawcho6\PAwChO_lab5\

    Files : *.*

  Options : *.* /S /E /DCOPY:DA /COPY:DAT /R:1000000 /W:30

------------------------------------------------------------------------------

          New Dir          4    C:\Users\anastasiia\PAwChO_lab5\
100%        New File                 761        Dockerfile4_2
100%        New File                 517        kod.js
100%        New File               38279        package-lock.json
100%        New File                 351        package.json
          New Dir          1    C:\Users\anastasiia\PAwChO_lab5\node_modules\
100%        New File               37740        .package-lock.json
          New Dir         15    C:\Users\anastasiia\PAwChO_lab5\node_modules\.bin\
100%        New File                 371        mime
100%        New File                 316        mime.cmd
100%        New File                 769        mime.ps1
100%        New File                 393        nodemon
100%        New File                 327        nodemon.cmd
100%        New File                 813        nodemon.ps1
100%        New File                 393        nodetouch
100%        New File                 327        nodetouch.cmd
100%        New File                 813        nodetouch.ps1
100%        New File                 381        nopt
100%        New File                 321        nopt.cmd
100%        New File                 789        nopt.ps1
100%        New File                 389        semver
100%        New File                 325        semver.cmd
100%        New File                 805        semver.ps1
          New Dir          4    C:\Users\anastasiia\PAwChO_lab5\node_modules\abbrev\
100%        New File                1763        abbrev.js
100%        New File                2011        LICENSE
100%        New File                 509        package.json
100%        New File                 499        README.md
          New Dir          5    C:\Users\anastasiia\PAwChO_lab5\node_modules\accepts\
100%        New File                5096        HISTORY.md
100%        New File                5252        index.js
100%        New File                1167        LICENSE
100%        New File                1157        package.json
100%        New File                4123        README.md
          New Dir          5    C:\Users\anastasiia\PAwChO_lab5\node_modules\anymatch\
100%        New File                 763        index.d.ts
100%        New File                3180        index.js
100%        New File                 784        LICENSE
100%        New File                 904        package.json
100%        New File                4023        README.md
          New Dir          4    C:\Users\anastasiia\PAwChO_lab5\node_modules\array-flatten\
100%        New File                1195        array-flatten.js
100%        New File                1103        LICENSE
100%        New File                 879        package.json
100%        New File                1245        README.md
          New Dir          4    C:\Users\anastasiia\PAwChO_lab5\node_modules\balanced-match\
100%        New File                1219        index.js
100%        New File                1096        LICENSE.md
100%        New File                1069        package.json
100%        New File                3502        README.md
          New Dir          1    C:\Users\anastasiia\PAwChO_lab5\node_modules\balanced-match\.github\
100%        New File                  53        FUNDING.yml
          New Dir          7    C:\Users\anastasiia\PAwChO_lab5\node_modules\binary-extensions\
100%        New File                2193        binary-extensions.json
100%        New File                  87        binary-extensions.json.d.ts
100%        New File                 249        index.d.ts
100%        New File                  54        index.js
100%        New File                1167        license
100%        New File                 739        package.json
100%        New File                 541        readme.md
          New Dir          6    C:\Users\anastasiia\PAwChO_lab5\node_modules\body-parser\
100%        New File               16491        HISTORY.md
100%        New File                2681        index.js
100%        New File                1172        LICENSE
100%        New File                1472        package.json
100%        New File               18182        README.md
100%        New File                1193        SECURITY.md
          New Dir          1    C:\Users\anastasiia\PAwChO_lab5\node_modules\body-parser\lib\
100%        New File                4325        read.js
          New Dir          4    C:\Users\anastasiia\PAwChO_lab5\node_modules\body-parser\lib\types\
100%        New File                5299        json.js
100%        New File                1884        raw.js
100%        New File                2285        text.js
100%        New File                5797        urlencoded.js
          New Dir          4    C:\Users\anastasiia\PAwChO_lab5\node_modules\brace-expansion\
100%        New File                4792        index.js
100%        New File                1096        LICENSE
100%        New File                1113        package.json
100%        New File                4058        README.md
          New Dir          5    C:\Users\anastasiia\PAwChO_lab5\node_modules\braces\
100%        New File                5147        CHANGELOG.md
100%        New File                4375        index.js
100%        New File                1088        LICENSE
100%        New File                1647        package.json
100%        New File               21130        README.md
          New Dir          6    C:\Users\anastasiia\PAwChO_lab5\node_modules\braces\lib\
100%        New File                1415        compile.js
100%        New File                1593        constants.js
100%        New File                2780        expand.js
100%        New File                6913        parse.js
100%        New File                 700        stringify.js
100%        New File                2451        utils.js
          New Dir          5    C:\Users\anastasiia\PAwChO_lab5\node_modules\bytes\
100%        New File                1775        History.md
100%        New File                3613        index.js
100%        New File                1153        LICENSE
100%        New File                 959        package.json
100%        New File                4770        Readme.md
          New Dir          9    C:\Users\anastasiia\PAwChO_lab5\node_modules\call-bind\
100%        New File                  10        .eslintignore
100%        New File                 208        .eslintrc
100%        New File                 139        .nycrc
100%        New File                 413        callBound.js
100%        New File                8142        CHANGELOG.md
100%        New File                1037        index.js
100%        New File                1071        LICENSE
100%        New File                2304        package.json
100%        New File                2026        README.md
          New Dir          1    C:\Users\anastasiia\PAwChO_lab5\node_modules\call-bind\.github\
100%        New File                 580        FUNDING.yml
          New Dir          2    C:\Users\anastasiia\PAwChO_lab5\node_modules\call-bind\test\
100%        New File                2349        callBound.js
100%        New File                3839        index.js
          New Dir          4    C:\Users\anastasiia\PAwChO_lab5\node_modules\chokidar\
100%        New File               28379        index.js
100%        New File                1129        LICENSE
100%        New File                1648        package.json
100%        New File               14392        README.md
          New Dir          3    C:\Users\anastasiia\PAwChO_lab5\node_modules\chokidar\lib\
100%        New File                1878        constants.js
100%        New File               16368        fsevents-handler.js
100%        New File               20067        nodefs-handler.js
          New Dir          1    C:\Users\anastasiia\PAwChO_lab5\node_modules\chokidar\types\
100%        New File                6339        index.d.ts
          New Dir          5    C:\Users\anastasiia\PAwChO_lab5\node_modules\concat-map\
100%        New File                  43        .travis.yml
100%        New File                 345        index.js
100%        New File                1073        LICENSE
100%        New File                 989        package.json
100%        New File                1165        README.markdown
          New Dir          1    C:\Users\anastasiia\PAwChO_lab5\node_modules\concat-map\example\
100%        New File                 171        map.js
          New Dir          1    C:\Users\anastasiia\PAwChO_lab5\node_modules\concat-map\test\
100%        New File                1075        map.js
          New Dir          5    C:\Users\anastasiia\PAwChO_lab5\node_modules\content-disposition\
100%        New File                1020        HISTORY.md
100%        New File               10594        index.js
100%        New File                1094        LICENSE
100%        New File                1200        package.json
100%        New File                5205        README.md
          New Dir          5    C:\Users\anastasiia\PAwChO_lab5\node_modules\content-type\
100%        New File                 523        HISTORY.md
100%        New File                5002        index.js
100%        New File                1089        LICENSE
100%        New File                1075        package.json
100%        New File                2782        README.md
          New Dir          6    C:\Users\anastasiia\PAwChO_lab5\node_modules\cookie\
100%        New File                3189        HISTORY.md
100%        New File                5281        index.js
100%        New File                1175        LICENSE
100%        New File                1142        package.json
100%        New File               11769        README.md
100%        New File                1180        SECURITY.md
          New Dir          5    C:\Users\anastasiia\PAwChO_lab5\node_modules\cookie-signature\
100%        New File                  29        .npmignore
100%        New File                 695        History.md
100%        New File                1230        index.js
100%        New File                 492        package.json
100%        New File                1490        Readme.md
          New Dir         12    C:\Users\anastasiia\PAwChO_lab5\node_modules\debug\
100%        New File                  46        .coveralls.yml
100%        New File                 180        .eslintrc
100%        New File                  72        .npmignore
100%        New File                 140        .travis.yml
100%        New File               11707        CHANGELOG.md
100%        New File                 321        component.json
100%        New File                1736        karma.conf.js
100%        New File                1107        LICENSE
100%        New File                1059        Makefile
100%        New File                  40        node.js
100%        New File                1138        package.json
100%        New File               17918        README.md
          New Dir          5    C:\Users\anastasiia\PAwChO_lab5\node_modules\debug\src\
100%        New File                4734        browser.js
100%        New File                4394        debug.js
100%        New File                 263        index.js
100%        New File                 373        inspector-log.js
100%        New File                6015        node.js
          New Dir          9    C:\Users\anastasiia\PAwChO_lab5\node_modules\define-data-property\
100%        New File                 291        .eslintrc
100%        New File                 216        .nycrc
100%        New File                5390        CHANGELOG.md
100%        New File                 315        index.d.ts
100%        New File                2336        index.js
100%        New File                1071        LICENSE
100%        New File                2856        package.json
100%        New File                2431        README.md
100%        New File                4883        tsconfig.json
          New Dir          1    C:\Users\anastasiia\PAwChO_lab5\node_modules\define-data-property\.github\
100%        New File                 591        FUNDING.yml
          New Dir          1    C:\Users\anastasiia\PAwChO_lab5\node_modules\define-data-property\test\
100%        New File               10471        index.js
          New Dir          5    C:\Users\anastasiia\PAwChO_lab5\node_modules\depd\
100%        New File                2256        History.md
100%        New File               10932        index.js
100%        New File                1094        LICENSE
100%        New File                1335        package.json
100%        New File                9988        Readme.md
          New Dir          0    C:\Users\anastasiia\PAwChO_lab5\node_modules\depd\lib\
          New Dir          1    C:\Users\anastasiia\PAwChO_lab5\node_modules\depd\lib\browser\
100%        New File                1512        index.js
          New Dir          4    C:\Users\anastasiia\PAwChO_lab5\node_modules\destroy\
100%        New File                4258        index.js
100%        New File                1173        LICENSE
100%        New File                1128        package.json
100%        New File                2459        README.md
          New Dir          4    C:\Users\anastasiia\PAwChO_lab5\node_modules\ee-first\
100%        New File                1684        index.js
100%        New File                1099        LICENSE
100%        New File                 859        package.json
100%        New File                2617        README.md
          New Dir          5    C:\Users\anastasiia\PAwChO_lab5\node_modules\encodeurl\
100%        New File                 238        HISTORY.md
100%        New File                1586        index.js
100%        New File                1089        LICENSE
100%        New File                1091        package.json
100%        New File                3855        README.md
          New Dir          9    C:\Users\anastasiia\PAwChO_lab5\node_modules\es-define-property\
100%        New File                 144        .eslintrc
100%        New File                 139        .nycrc
100%        New File                 822        CHANGELOG.md
100%        New File                  93        index.d.ts
100%        New File                 358        index.js
100%        New File                1071        LICENSE
100%        New File                2112        package.json
100%        New File                2056        README.md
100%        New File                3195        tsconfig.json
          New Dir          1    C:\Users\anastasiia\PAwChO_lab5\node_modules\es-define-property\.github\
100%        New File                 564        FUNDING.yml
          New Dir          1    C:\Users\anastasiia\PAwChO_lab5\node_modules\es-define-property\test\
100%        New File                1244        index.js
          New Dir         20    C:\Users\anastasiia\PAwChO_lab5\node_modules\es-errors\
100%        New File                  43        .eslintrc
100%        New File                1833        CHANGELOG.md
100%        New File                  68        eval.d.ts
100%        New File                  75        eval.js
100%        New File                  56        index.d.ts
100%        New File                  66        index.js
100%        New File                1071        LICENSE
100%        New File                2174        package.json
100%        New File                  71        range.d.ts
100%        New File                  77        range.js
100%        New File                2114        README.md
100%        New File                  83        ref.d.ts
100%        New File                  79        ref.js
100%        New File                  74        syntax.d.ts
100%        New File                  79        syntax.js
100%        New File                3170        tsconfig.json
100%        New File                  67        type.d.ts
100%        New File                  75        type.js
100%        New File                  65        uri.d.ts
100%        New File                  73        uri.js
          New Dir          1    C:\Users\anastasiia\PAwChO_lab5\node_modules\es-errors\.github\
100%        New File                 555        FUNDING.yml
          New Dir          1    C:\Users\anastasiia\PAwChO_lab5\node_modules\es-errors\test\
100%        New File                 356        index.js
          New Dir          4    C:\Users\anastasiia\PAwChO_lab5\node_modules\escape-html\
100%        New File                1362        index.js
100%        New File                1157        LICENSE
100%        New File                 434        package.json
100%        New File                 707        Readme.md
          New Dir          5    C:\Users\anastasiia\PAwChO_lab5\node_modules\etag\
100%        New File                1732        HISTORY.md
100%        New File                2479        index.js
100%        New File                1094        LICENSE
100%        New File                1306        package.json
100%        New File                4198        README.md
          New Dir          5    C:\Users\anastasiia\PAwChO_lab5\node_modules\express\
100%        New File              113674        History.md
100%        New File                 224        index.js
100%        New File                1249        LICENSE
100%        New File                2597        package.json
100%        New File                5421        Readme.md
          New Dir          6    C:\Users\anastasiia\PAwChO_lab5\node_modules\express\lib\
100%        New File               14593        application.js
100%        New File                2409        express.js
100%        New File               12505        request.js
100%        New File               28339        response.js
100%        New File                5871        utils.js
100%        New File                3325        view.js
          New Dir          2    C:\Users\anastasiia\PAwChO_lab5\node_modules\express\lib\middleware\
100%        New File                 853        init.js
100%        New File                 885        query.js
          New Dir          3    C:\Users\anastasiia\PAwChO_lab5\node_modules\express\lib\router\
100%        New File               15123        index.js
100%        New File                3296        layer.js
100%        New File                4399        route.js
          New Dir          4    C:\Users\anastasiia\PAwChO_lab5\node_modules\fill-range\
100%        New File                6315        index.js
100%        New File                1091        LICENSE
100%        New File                1459        package.json
100%        New File                7486        README.md
          New Dir          6    C:\Users\anastasiia\PAwChO_lab5\node_modules\finalhandler\
100%        New File                4292        HISTORY.md
100%        New File                6689        index.js
100%        New File                1119        LICENSE
100%        New File                1207        package.json
100%        New File                4133        README.md
100%        New File                1202        SECURITY.md
          New Dir          5    C:\Users\anastasiia\PAwChO_lab5\node_modules\forwarded\
100%        New File                 400        HISTORY.md
100%        New File                1578        index.js
100%        New File                1094        LICENSE
100%        New File                1150        package.json
100%        New File                1654        README.md
          New Dir          5    C:\Users\anastasiia\PAwChO_lab5\node_modules\fresh\
100%        New File                1500        HISTORY.md
100%        New File                2711        index.js
100%        New File                1174        LICENSE
100%        New File                1357        package.json
100%        New File                3374        README.md
          New Dir          8    C:\Users\anastasiia\PAwChO_lab5\node_modules\function-bind\
100%        New File                 253        .eslintrc
100%        New File                 216        .nycrc
100%        New File               13812        CHANGELOG.md
100%        New File                2043        implementation.js
100%        New File                 126        index.js
100%        New File                1052        LICENSE
100%        New File                2262        package.json
100%        New File                1755        README.md
          New Dir          2    C:\Users\anastasiia\PAwChO_lab5\node_modules\function-bind\.github\
100%        New File                 584        FUNDING.yml
100%        New File                 157        SECURITY.md
          New Dir          2    C:\Users\anastasiia\PAwChO_lab5\node_modules\function-bind\test\
100%        New File                 176        .eslintrc
100%        New File                8991        index.js
          New Dir          7    C:\Users\anastasiia\PAwChO_lab5\node_modules\get-intrinsic\
100%        New File                 603        .eslintrc
100%        New File                 139        .nycrc
100%        New File               11640        CHANGELOG.md
100%        New File               13615        index.js
100%        New File                1071        LICENSE
100%        New File                2414        package.json
100%        New File                2791        README.md
          New Dir          1    C:\Users\anastasiia\PAwChO_lab5\node_modules\get-intrinsic\.github\
100%        New File                 584        FUNDING.yml
          New Dir          1    C:\Users\anastasiia\PAwChO_lab5\node_modules\get-intrinsic\test\
100%        New File                8767        GetIntrinsic.js
          New Dir          5    C:\Users\anastasiia\PAwChO_lab5\node_modules\glob-parent\
100%        New File                4510        CHANGELOG.md
100%        New File                1120        index.js
100%        New File                 753        LICENSE
100%        New File                1105        package.json
100%        New File                4646        README.md
          New Dir          6    C:\Users\anastasiia\PAwChO_lab5\node_modules\gopd\
100%        New File                 224        .eslintrc
100%        New File                1541        CHANGELOG.md
100%        New File                 263        index.js
100%        New File                1071        LICENSE
100%        New File                1877        package.json
100%        New File                1562        README.md
          New Dir          1    C:\Users\anastasiia\PAwChO_lab5\node_modules\gopd\.github\
100%        New File                 575        FUNDING.yml
          New Dir          1    C:\Users\anastasiia\PAwChO_lab5\node_modules\gopd\test\
100%        New File                 590        index.js
          New Dir          4    C:\Users\anastasiia\PAwChO_lab5\node_modules\has-flag\
100%        New File                 320        index.js
100%        New File                1109        license
100%        New File                 710        package.json
100%        New File                 986        readme.md
          New Dir          7    C:\Users\anastasiia\PAwChO_lab5\node_modules\has-property-descriptors\
100%        New File                 173        .eslintrc
100%        New File                 139        .nycrc
100%        New File                2648        CHANGELOG.md
100%        New File                 588        index.js
100%        New File                1067        LICENSE
100%        New File                2090        package.json
100%        New File                2206        README.md
          New Dir          1    C:\Users\anastasiia\PAwChO_lab5\node_modules\has-property-descriptors\.github\
100%        New File                 595        FUNDING.yml
          New Dir          1    C:\Users\anastasiia\PAwChO_lab5\node_modules\has-property-descriptors\test\
100%        New File                1405        index.js
          New Dir          8    C:\Users\anastasiia\PAwChO_lab5\node_modules\has-proto\
100%        New File                  43        .eslintrc
100%        New File                2200        CHANGELOG.md
100%        New File                  57        index.d.ts
100%        New File                 302        index.js
100%        New File                1067        LICENSE
100%        New File                2004        package.json
100%        New File                1623        README.md
100%        New File                3611        tsconfig.json
          New Dir          1    C:\Users\anastasiia\PAwChO_lab5\node_modules\has-proto\.github\
100%        New File                 580        FUNDING.yml
          New Dir          1    C:\Users\anastasiia\PAwChO_lab5\node_modules\has-proto\test\
100%        New File                 477        index.js
          New Dir          8    C:\Users\anastasiia\PAwChO_lab5\node_modules\has-symbols\
100%        New File                 164        .eslintrc
100%        New File                 139        .nycrc
100%        New File                7690        CHANGELOG.md
100%        New File                 420        index.js
100%        New File                1071        LICENSE
100%        New File                2648        package.json
100%        New File                2044        README.md
100%        New File                1761        shams.js
          New Dir          1    C:\Users\anastasiia\PAwChO_lab5\node_modules\has-symbols\.github\
100%        New File                 582        FUNDING.yml
          New Dir          2    C:\Users\anastasiia\PAwChO_lab5\node_modules\has-symbols\test\
100%        New File                 654        index.js
100%        New File                2021        tests.js
          New Dir          2    C:\Users\anastasiia\PAwChO_lab5\node_modules\has-symbols\test\shams\
100%        New File                 723        core-js.js
100%        New File                 686        get-own-property-symbols.js
          New Dir          9    C:\Users\anastasiia\PAwChO_lab5\node_modules\hasown\
100%        New File                  43        .eslintrc
100%        New File                 216        .nycrc
100%        New File                2579        CHANGELOG.md
100%        New File                 117        index.d.ts
100%        New File                 206        index.js
100%        New File                1083        LICENSE
100%        New File                2283        package.json
100%        New File                1613        README.md
100%        New File                  73        tsconfig.json
          New Dir          1    C:\Users\anastasiia\PAwChO_lab5\node_modules\hasown\.github\
100%        New File                 552        FUNDING.yml
          New Dir          5    C:\Users\anastasiia\PAwChO_lab5\node_modules\http-errors\
100%        New File                3973        HISTORY.md
100%        New File                6391        index.js
100%        New File                1168        LICENSE
100%        New File                1314        package.json
100%        New File                5962        README.md
          New Dir          4    C:\Users\anastasiia\PAwChO_lab5\node_modules\iconv-lite\
100%        New File                4342        Changelog.md
100%        New File                1064        LICENSE
100%        New File                1227        package.json
100%        New File                6534        README.md
          New Dir          9    C:\Users\anastasiia\PAwChO_lab5\node_modules\iconv-lite\encodings\
100%        New File               21415        dbcs-codec.js
100%        New File                8291        dbcs-data.js
100%        New File                 710        index.js
100%        New File                6115        internal.js
100%        New File                2191        sbcs-codec.js
100%        New File               32034        sbcs-data-generated.js
100%        New File                4686        sbcs-data.js
100%        New File                5011        utf16.js
100%        New File                9215        utf7.js
          New Dir          8    C:\Users\anastasiia\PAwChO_lab5\node_modules\iconv-lite\encodings\tables\
100%        New File               17717        big5-added.json
100%        New File               47320        cp936.json
100%        New File               38122        cp949.json
100%        New File               42356        cp950.json
100%        New File               41064        eucjp.json
100%        New File                2216        gb18030-ranges.json
100%        New File                1227        gbk-added.json
100%        New File               23782        shiftjis.json
          New Dir          5    C:\Users\anastasiia\PAwChO_lab5\node_modules\iconv-lite\lib\
100%        New File                1109        bom-handling.js
100%        New File                8701        extend-node.js
100%        New File                 982        index.d.ts
100%        New File                5123        index.js
100%        New File                3387        streams.js
          New Dir          4    C:\Users\anastasiia\PAwChO_lab5\node_modules\ignore-by-default\
100%        New File                 614        index.js
100%        New File                 748        LICENSE
100%        New File                 775        package.json
100%        New File                 680        README.md
          New Dir          5    C:\Users\anastasiia\PAwChO_lab5\node_modules\inherits\
100%        New File                 250        inherits.js
100%        New File                 753        inherits_browser.js
100%        New File                 749        LICENSE
100%        New File                 581        package.json
100%        New File                1625        README.md
          New Dir          4    C:\Users\anastasiia\PAwChO_lab5\node_modules\ipaddr.js\
100%        New File                9738        ipaddr.min.js
100%        New File                1087        LICENSE
100%        New File                 719        package.json
100%        New File                8309        README.md
          New Dir          2    C:\Users\anastasiia\PAwChO_lab5\node_modules\ipaddr.js\lib\
100%        New File               19333        ipaddr.js
100%        New File                2959        ipaddr.js.d.ts
          New Dir          5    C:\Users\anastasiia\PAwChO_lab5\node_modules\is-binary-path\
100%        New File                 290        index.d.ts
100%        New File                 239        index.js
100%        New File                1159        license
100%        New File                 657        package.json
100%        New File                 733        readme.md
          New Dir          4    C:\Users\anastasiia\PAwChO_lab5\node_modules\is-extglob\
100%        New File                 441        index.js
100%        New File                1087        LICENSE
100%        New File                1220        package.json
100%        New File                3469        README.md
          New Dir          4    C:\Users\anastasiia\PAwChO_lab5\node_modules\is-glob\
100%        New File                3628        index.js
100%        New File                1088        LICENSE
100%        New File                1748        package.json
100%        New File                7145        README.md
          New Dir          4    C:\Users\anastasiia\PAwChO_lab5\node_modules\is-number\
100%        New File                 411        index.js
100%        New File                1091        LICENSE
100%        New File                1599        package.json
100%        New File                6514        README.md
          New Dir          4    C:\Users\anastasiia\PAwChO_lab5\node_modules\lru-cache\
100%        New File                8186        index.js
100%        New File                 765        LICENSE
100%        New File                 705        package.json
100%        New File                5987        README.md
          New Dir          5    C:\Users\anastasiia\PAwChO_lab5\node_modules\media-typer\
100%        New File                 461        HISTORY.md
100%        New File                6375        index.js
100%        New File                1089        LICENSE
100%        New File                 759        package.json
100%        New File                2371        README.md
          New Dir          5    C:\Users\anastasiia\PAwChO_lab5\node_modules\merge-descriptors\
100%        New File                 363        HISTORY.md
100%        New File                1215        index.js
100%        New File                1167        LICENSE
100%        New File                 931        package.json
100%        New File                1213        README.md
          New Dir          5    C:\Users\anastasiia\PAwChO_lab5\node_modules\methods\
100%        New File                 427        HISTORY.md
100%        New File                1040        index.js
100%        New File                1180        LICENSE
100%        New File                 947        package.json
100%        New File                1694        README.md
          New Dir          8    C:\Users\anastasiia\PAwChO_lab5\node_modules\mime\
            New File                   0        .npmignore
100%        New File                9473        CHANGELOG.md
100%        New File                 149        cli.js
100%        New File                1098        LICENSE
100%        New File                2726        mime.js
100%        New File                 933        package.json
100%        New File                2119        README.md
100%        New File               31555        types.json
          New Dir          2    C:\Users\anastasiia\PAwChO_lab5\node_modules\mime\src\
100%        New File                1351        build.js
100%        New File                2334        test.js
          New Dir          6    C:\Users\anastasiia\PAwChO_lab5\node_modules\mime-db\
100%        New File              185882        db.json
100%        New File               12581        HISTORY.md
100%        New File                 189        index.js
100%        New File                1172        LICENSE
100%        New File                1624        package.json
100%        New File                4091        README.md
          New Dir          5    C:\Users\anastasiia\PAwChO_lab5\node_modules\mime-types\
100%        New File                8812        HISTORY.md
100%        New File                3663        index.js
100%        New File                1167        LICENSE
100%        New File                1149        package.json
100%        New File                3481        README.md
          New Dir          4    C:\Users\anastasiia\PAwChO_lab5\node_modules\minimatch\
100%        New File                 765        LICENSE
100%        New File               26266        minimatch.js
100%        New File                 700        package.json
100%        New File                7171        README.md
          New Dir          4    C:\Users\anastasiia\PAwChO_lab5\node_modules\ms\
100%        New File                2764        index.js
100%        New File                1077        license.md
100%        New File                 704        package.json
100%        New File                1721        readme.md
          New Dir          5    C:\Users\anastasiia\PAwChO_lab5\node_modules\negotiator\
100%        New File                2499        HISTORY.md
100%        New File                2451        index.js
100%        New File                1177        LICENSE
100%        New File                 993        package.json
100%        New File                4901        README.md
          New Dir          4    C:\Users\anastasiia\PAwChO_lab5\node_modules\negotiator\lib\
100%        New File                3081        charset.js
100%        New File                3506        encoding.js
100%        New File                3409        language.js
100%        New File                5358        mediaType.js
          New Dir          4    C:\Users\anastasiia\PAwChO_lab5\node_modules\nodemon\
100%        New File                  26        .prettierrc.json
100%        New File                1122        LICENSE
100%        New File                2044        package.json
100%        New File               46535        README.md
          New Dir          2    C:\Users\anastasiia\PAwChO_lab5\node_modules\nodemon\bin\
100%        New File                 436        nodemon.js
100%        New File               80384        windows-kill.exe
          New Dir          0    C:\Users\anastasiia\PAwChO_lab5\node_modules\nodemon\doc\
          New Dir          8    C:\Users\anastasiia\PAwChO_lab5\node_modules\nodemon\doc\cli\
100%        New File                 236        authors.txt
100%        New File                1158        config.txt
100%        New File                1268        help.txt
100%        New File                 799        logo.txt
100%        New File                1869        options.txt
100%        New File                 325        topics.txt
100%        New File                  88        usage.txt
100%        New File                1223        whoami.txt
          New Dir          4    C:\Users\anastasiia\PAwChO_lab5\node_modules\nodemon\lib\
100%        New File                  38        index.js
100%        New File                8777        nodemon.js
100%        New File                1930        spawn.js
100%        New File                2465        version.js
          New Dir          2    C:\Users\anastasiia\PAwChO_lab5\node_modules\nodemon\lib\cli\
100%        New File                1089        index.js
100%        New File                6039        parse.js
          New Dir          5    C:\Users\anastasiia\PAwChO_lab5\node_modules\nodemon\lib\config\
100%        New File                1249        command.js
100%        New File                 979        defaults.js
100%        New File                6932        exec.js
100%        New File                2511        index.js
100%        New File                6571        load.js
          New Dir          1    C:\Users\anastasiia\PAwChO_lab5\node_modules\nodemon\lib\help\
100%        New File                 733        index.js
          New Dir          5    C:\Users\anastasiia\PAwChO_lab5\node_modules\nodemon\lib\monitor\
100%        New File                  82        index.js
100%        New File                6730        match.js
100%        New File               16782        run.js
100%        New File                 488        signals.js
100%        New File                6567        watch.js
          New Dir          3    C:\Users\anastasiia\PAwChO_lab5\node_modules\nodemon\lib\rules\
100%        New File                2662        add.js
100%        New File                1260        index.js
100%        New File                 804        parse.js
          New Dir          6    C:\Users\anastasiia\PAwChO_lab5\node_modules\nodemon\lib\utils\
100%        New File                 946        bus.js
100%        New File                 829        clone.js
100%        New File                 690        colour.js
100%        New File                2624        index.js
100%        New File                1738        log.js
100%        New File                1186        merge.js
          New Dir          0    C:\Users\anastasiia\PAwChO_lab5\node_modules\nodemon\node_modules\
          New Dir          3    C:\Users\anastasiia\PAwChO_lab5\node_modules\nodemon\node_modules\debug\
100%        New File                1139        LICENSE
100%        New File                1419        package.json
100%        New File               22496        README.md
          New Dir          4    C:\Users\anastasiia\PAwChO_lab5\node_modules\nodemon\node_modules\debug\src\
100%        New File                6010        browser.js
100%        New File                6289        common.js
100%        New File                 314        index.js
100%        New File                4685        node.js
          New Dir          4    C:\Users\anastasiia\PAwChO_lab5\node_modules\nodemon\node_modules\ms\
100%        New File                3023        index.js
100%        New File                1077        license.md
100%        New File                 705        package.json
100%        New File                2037        readme.md
          New Dir          4    C:\Users\anastasiia\PAwChO_lab5\node_modules\nopt\
            New File                   0        .npmignore
100%        New File                1092        LICENSE
100%        New File                 485        package.json
100%        New File                7476        README.md
          New Dir          1    C:\Users\anastasiia\PAwChO_lab5\node_modules\nopt\bin\
100%        New File                1277        nopt.js
          New Dir          1    C:\Users\anastasiia\PAwChO_lab5\node_modules\nopt\examples\
100%        New File                1032        my-program.js
          New Dir          1    C:\Users\anastasiia\PAwChO_lab5\node_modules\nopt\lib\
100%        New File               15345        nopt.js
          New Dir          4    C:\Users\anastasiia\PAwChO_lab5\node_modules\normalize-path\
100%        New File                1024        index.js
100%        New File                1088        LICENSE
100%        New File                1666        package.json
100%        New File                5441        README.md
          New Dir         10    C:\Users\anastasiia\PAwChO_lab5\node_modules\object-inspect\
100%        New File                1298        .eslintrc
100%        New File                 236        .nycrc
100%        New File               33226        CHANGELOG.md
100%        New File               18882        index.js
100%        New File                1071        LICENSE
100%        New File                 365        package-support.json
100%        New File                2702        package.json
100%        New File                2934        readme.markdown
100%        New File                 534        test-core-js.js
100%        New File                  42        util.inspect.js
          New Dir          1    C:\Users\anastasiia\PAwChO_lab5\node_modules\object-inspect\.github\
100%        New File                 585        FUNDING.yml
          New Dir          4    C:\Users\anastasiia\PAwChO_lab5\node_modules\object-inspect\example\
100%        New File                 391        all.js
100%        New File                 116        circular.js
100%        New File                 126        fn.js
100%        New File                 251        inspect.js
          New Dir         18    C:\Users\anastasiia\PAwChO_lab5\node_modules\object-inspect\test\
100%        New File                2082        bigint.js
100%        New File                 451        circular.js
100%        New File                 400        deep.js
100%        New File                1575        element.js
100%        New File                1536        err.js
100%        New File                 683        fakes.js
100%        New File                2227        fn.js
100%        New File                 372        global.js
100%        New File                 514        has.js
100%        New File                 255        holes.js
100%        New File                6633        indent-option.js
100%        New File                4946        inspect.js
100%        New File                 268        lowbyte.js
100%        New File                2312        number.js
100%        New File                 933        quoteStyle.js
100%        New File                1546        toStringTag.js
100%        New File                 302        undef.js
100%        New File                7034        values.js
          New Dir          1    C:\Users\anastasiia\PAwChO_lab5\node_modules\object-inspect\test\browser\
100%        New File                 416        dom.js
          New Dir          5    C:\Users\anastasiia\PAwChO_lab5\node_modules\on-finished\
100%        New File                1865        HISTORY.md
100%        New File                4430        index.js
100%        New File                1167        LICENSE
100%        New File                1057        package.json
100%        New File                5160        README.md
          New Dir          5    C:\Users\anastasiia\PAwChO_lab5\node_modules\parseurl\
100%        New File                1043        HISTORY.md
100%        New File                2809        index.js
100%        New File                1173        LICENSE
100%        New File                1180        package.json
100%        New File                4094        README.md
          New Dir          5    C:\Users\anastasiia\PAwChO_lab5\node_modules\path-to-regexp\
100%        New File                 694        History.md
100%        New File                3328        index.js
100%        New File                1103        LICENSE
100%        New File                 554        package.json
100%        New File                1102        Readme.md
          New Dir          5    C:\Users\anastasiia\PAwChO_lab5\node_modules\picomatch\
100%        New File                6203        CHANGELOG.md
100%        New File                  60        index.js
100%        New File                1091        LICENSE
100%        New File                1912        package.json
100%        New File               27445        README.md
          New Dir          5    C:\Users\anastasiia\PAwChO_lab5\node_modules\picomatch\lib\
100%        New File                4448        constants.js
100%        New File               27763        parse.js
100%        New File                9956        picomatch.js
100%        New File                9189        scan.js
100%        New File                1885        utils.js
          New Dir          5    C:\Users\anastasiia\PAwChO_lab5\node_modules\proxy-addr\
100%        New File                2991        HISTORY.md
100%        New File                6000        index.js
100%        New File                1094        LICENSE
100%        New File                1183        package.json
100%        New File                4131        README.md
          New Dir          4    C:\Users\anastasiia\PAwChO_lab5\node_modules\pstree.remy\
100%        New File                 100        .travis.yml
100%        New File                1126        LICENSE
100%        New File                 629        package.json
100%        New File                 421        README.md
          New Dir          3    C:\Users\anastasiia\PAwChO_lab5\node_modules\pstree.remy\lib\
100%        New File                 800        index.js
100%        New File                 857        tree.js
100%        New File                1171        utils.js
          New Dir          1    C:\Users\anastasiia\PAwChO_lab5\node_modules\pstree.remy\tests\
100%        New File                1387        index.test.js
          New Dir          3    C:\Users\anastasiia\PAwChO_lab5\node_modules\pstree.remy\tests\fixtures\
100%        New File                 282        index.js
100%        New File                2382        out1
100%        New File                5822        out2
          New Dir          7    C:\Users\anastasiia\PAwChO_lab5\node_modules\qs\
100%        New File                 569        .editorconfig
100%        New File                1025        .eslintrc
100%        New File                 216        .nycrc
100%        New File               29661        CHANGELOG.md
100%        New File                1600        LICENSE.md
100%        New File                2317        package.json
100%        New File               20966        README.md
          New Dir          1    C:\Users\anastasiia\PAwChO_lab5\node_modules\qs\.github\
100%        New File                 548        FUNDING.yml
          New Dir          1    C:\Users\anastasiia\PAwChO_lab5\node_modules\qs\dist\
100%        New File               69136        qs.js
          New Dir          5    C:\Users\anastasiia\PAwChO_lab5\node_modules\qs\lib\
100%        New File                 476        formats.js
100%        New File                 211        index.js
100%        New File                9380        parse.js
100%        New File               10358        stringify.js
100%        New File                6823        utils.js
          New Dir          3    C:\Users\anastasiia\PAwChO_lab5\node_modules\qs\test\
100%        New File               35871        parse.js
100%        New File               35186        stringify.js
100%        New File                5112        utils.js
          New Dir          5    C:\Users\anastasiia\PAwChO_lab5\node_modules\range-parser\
100%        New File                 917        HISTORY.md
100%        New File                2900        index.js
100%        New File                1178        LICENSE
100%        New File                1184        package.json
100%        New File                2278        README.md
          New Dir          7    C:\Users\anastasiia\PAwChO_lab5\node_modules\raw-body\
100%        New File                6048        HISTORY.md
100%        New File                2286        index.d.ts
100%        New File                7171        index.js
100%        New File                1181        LICENSE
100%        New File                1325        package.json
100%        New File                6553        README.md
100%        New File                1188        SECURITY.md
          New Dir          5    C:\Users\anastasiia\PAwChO_lab5\node_modules\readdirp\
100%        New File                1018        index.d.ts
100%        New File                8876        index.js
100%        New File                1114        LICENSE
100%        New File                2522        package.json
100%        New File                6942        README.md
          New Dir          5    C:\Users\anastasiia\PAwChO_lab5\node_modules\safe-buffer\
100%        New File                8738        index.d.ts
100%        New File                1670        index.js
100%        New File                1081        LICENSE
100%        New File                1057        package.json
100%        New File               19555        README.md
          New Dir          7    C:\Users\anastasiia\PAwChO_lab5\node_modules\safer-buffer\
100%        New File                1483        dangerous.js
100%        New File                1094        LICENSE
100%        New File                 822        package.json
100%        New File               12794        Porting-Buffer.md
100%        New File                8261        Readme.md
100%        New File                2110        safer.js
100%        New File               15735        tests.js
          New Dir          6    C:\Users\anastasiia\PAwChO_lab5\node_modules\semver\
100%        New File                2616        index.js
100%        New File                 765        LICENSE
100%        New File                1628        package.json
100%        New File                  69        preload.js
100%        New File                 619        range.bnf
100%        New File               23906        README.md
          New Dir          1    C:\Users\anastasiia\PAwChO_lab5\node_modules\semver\bin\
100%        New File                4823        semver.js
          New Dir          4    C:\Users\anastasiia\PAwChO_lab5\node_modules\semver\classes\
100%        New File                3617        comparator.js
100%        New File                 129        index.js
100%        New File               14514        range.js
100%        New File                8756        semver.js
          New Dir         24    C:\Users\anastasiia\PAwChO_lab5\node_modules\semver\functions\
100%        New File                 191        clean.js
100%        New File                 947        cmp.js
100%        New File                1990        coerce.js
100%        New File                 267        compare-build.js
100%        New File                 118        compare-loose.js
100%        New File                 156        compare.js
100%        New File                1612        diff.js
100%        New File                 112        eq.js
100%        New File                 110        gt.js
100%        New File                 113        gte.js
100%        New File                 464        inc.js
100%        New File                 110        lt.js
100%        New File                 113        lte.js
100%        New File                 122        major.js
100%        New File                 122        minor.js
100%        New File                 114        neq.js
100%        New File                 317        parse.js
100%        New File                 122        patch.js
100%        New File                 220        prerelease.js
100%        New File                 118        rcompare.js
100%        New File                 149        rsort.js
100%        New File                 233        satisfies.js
100%        New File                 147        sort.js
100%        New File                 162        valid.js
          New Dir          5    C:\Users\anastasiia\PAwChO_lab5\node_modules\semver\internal\
100%        New File                 859        constants.js
100%        New File                 226        debug.js
100%        New File                 410        identifiers.js
100%        New File                 324        parse-options.js
100%        New File                7937        re.js
          New Dir         11    C:\Users\anastasiia\PAwChO_lab5\node_modules\semver\ranges\
100%        New File                 217        gtr.js
100%        New File                 210        intersects.js
100%        New File                 213        ltr.js
100%        New File                 579        max-satisfying.js
100%        New File                 577        min-satisfying.js
100%        New File                1500        min-version.js
100%        New File                2190        outside.js
100%        New File                1341        simplify.js
100%        New File                7510        subset.js
100%        New File                 268        to-comparators.js
100%        New File                 312        valid.js
          New Dir          6    C:\Users\anastasiia\PAwChO_lab5\node_modules\send\
100%        New File               13301        HISTORY.md
100%        New File               23502        index.js
100%        New File                1128        LICENSE
100%        New File                1571        package.json
100%        New File                9476        README.md
100%        New File                1170        SECURITY.md
          New Dir          0    C:\Users\anastasiia\PAwChO_lab5\node_modules\send\node_modules\
          New Dir          4    C:\Users\anastasiia\PAwChO_lab5\node_modules\send\node_modules\ms\
100%        New File                3024        index.js
100%        New File                1079        license.md
100%        New File                 732        package.json
100%        New File                1886        readme.md
          New Dir          5    C:\Users\anastasiia\PAwChO_lab5\node_modules\serve-static\
100%        New File               10537        HISTORY.md
100%        New File                4570        index.js
100%        New File                1189        LICENSE
100%        New File                1141        package.json
100%        New File                7812        README.md
          New Dir         11    C:\Users\anastasiia\PAwChO_lab5\node_modules\set-function-length\
100%        New File                 404        .eslintrc
100%        New File                 216        .nycrc
100%        New File                4876        CHANGELOG.md
100%        New File                 222        env.d.ts
100%        New File                 867        env.js
100%        New File                 256        index.d.ts
100%        New File                1273        index.js
100%        New File                1083        LICENSE
100%        New File                2704        package.json
100%        New File                2167        README.md
100%        New File                 116        tsconfig.json
          New Dir          1    C:\Users\anastasiia\PAwChO_lab5\node_modules\set-function-length\.github\
100%        New File                 563        FUNDING.yml
          New Dir          5    C:\Users\anastasiia\PAwChO_lab5\node_modules\setprototypeof\
100%        New File                  93        index.d.ts
100%        New File                 407        index.js
100%        New File                 727        LICENSE
100%        New File                1264        package.json
100%        New File                 844        README.md
          New Dir          1    C:\Users\anastasiia\PAwChO_lab5\node_modules\setprototypeof\test\
100%        New File                 690        index.js
          New Dir         10    C:\Users\anastasiia\PAwChO_lab5\node_modules\side-channel\
100%        New File                 145        .editorconfig
100%        New File                 185        .eslintrc
100%        New File                 216        .nycrc
100%        New File                8802        CHANGELOG.md
100%        New File                 765        index.d.ts
100%        New File                3946        index.js
100%        New File                1071        LICENSE
100%        New File                2275        package.json
100%        New File                  98        README.md
100%        New File                3195        tsconfig.json
          New Dir          1    C:\Users\anastasiia\PAwChO_lab5\node_modules\side-channel\.github\
100%        New File                 583        FUNDING.yml
          New Dir          1    C:\Users\anastasiia\PAwChO_lab5\node_modules\side-channel\test\
100%        New File                1959        index.js
          New Dir          3    C:\Users\anastasiia\PAwChO_lab5\node_modules\simple-update-notifier\
100%        New File                1069        LICENSE
100%        New File                2510        package.json
100%        New File                2486        README.md
          New Dir          2    C:\Users\anastasiia\PAwChO_lab5\node_modules\simple-update-notifier\build\
100%        New File                 342        index.d.ts
100%        New File                9909        index.js
          New Dir         11    C:\Users\anastasiia\PAwChO_lab5\node_modules\simple-update-notifier\src\
100%        New File                 371        borderedText.ts
100%        New File                 527        cache.spec.ts
100%        New File                1054        cache.ts
100%        New File                 810        getDistVersion.spec.ts
100%        New File                 811        getDistVersion.ts
100%        New File                2375        hasNewVersion.spec.ts
100%        New File                1147        hasNewVersion.ts
100%        New File                 744        index.spec.ts
100%        New File                 984        index.ts
100%        New File                 444        isNpmOrYarn.ts
100%        New File                 202        types.ts
          New Dir          6    C:\Users\anastasiia\PAwChO_lab5\node_modules\statuses\
100%        New File                1789        codes.json
100%        New File                1546        HISTORY.md
100%        New File                2610        index.js
100%        New File                1172        LICENSE
100%        New File                1440        package.json
100%        New File                3559        README.md
          New Dir          5    C:\Users\anastasiia\PAwChO_lab5\node_modules\supports-color\
100%        New File                  67        browser.js
100%        New File                2771        index.js
100%        New File                1109        license
100%        New File                 818        package.json
100%        New File                1865        readme.md
          New Dir          4    C:\Users\anastasiia\PAwChO_lab5\node_modules\to-regex-range\
100%        New File                6481        index.js
100%        New File                1091        LICENSE
100%        New File                1782        package.json
100%        New File               13585        README.md
          New Dir          5    C:\Users\anastasiia\PAwChO_lab5\node_modules\toidentifier\
100%        New File                 128        HISTORY.md
100%        New File                 504        index.js
100%        New File                1108        LICENSE
100%        New File                1142        package.json
100%        New File                1803        README.md
          New Dir          4    C:\Users\anastasiia\PAwChO_lab5\node_modules\touch\
100%        New File                5038        index.js
100%        New File                 748        LICENSE
100%        New File                 654        package.json
100%        New File                1224        README.md
          New Dir          1    C:\Users\anastasiia\PAwChO_lab5\node_modules\touch\bin\
100%        New File                2612        nodetouch.js
          New Dir          5    C:\Users\anastasiia\PAwChO_lab5\node_modules\type-is\
100%        New File                5447        HISTORY.md
100%        New File                5562        index.js
100%        New File                1172        LICENSE
100%        New File                1133        package.json
100%        New File                5183        README.md
          New Dir          7    C:\Users\anastasiia\PAwChO_lab5\node_modules\undefsafe\
100%        New File                 364        .jscsrc
100%        New File                 240        .jshintrc
100%        New File                 283        .travis.yml
100%        New File                 245        example.js
100%        New File                1119        LICENSE
100%        New File                 784        package.json
100%        New File                1414        README.md
          New Dir          0    C:\Users\anastasiia\PAwChO_lab5\node_modules\undefsafe\.github\
          New Dir          1    C:\Users\anastasiia\PAwChO_lab5\node_modules\undefsafe\.github\workflows\
100%        New File                 556        release.yml
          New Dir          1    C:\Users\anastasiia\PAwChO_lab5\node_modules\undefsafe\lib\
100%        New File                2595        undefsafe.js
          New Dir          5    C:\Users\anastasiia\PAwChO_lab5\node_modules\unpipe\
100%        New File                  59        HISTORY.md
100%        New File                1118        index.js
100%        New File                1114        LICENSE
100%        New File                 770        package.json
100%        New File                1250        README.md
          New Dir          5    C:\Users\anastasiia\PAwChO_lab5\node_modules\utils-merge\
100%        New File                  79        .npmignore
100%        New File                 381        index.js
100%        New File                1084        LICENSE
100%        New File                 857        package.json
100%        New File                1319        README.md
          New Dir          5    C:\Users\anastasiia\PAwChO_lab5\node_modules\vary\
100%        New File                 792        HISTORY.md
100%        New File                2930        index.js
100%        New File                1094        LICENSE
100%        New File                1215        package.json
100%        New File                2716        README.md
          New Dir          5    C:\Users\anastasiia\PAwChO_lab5\node_modules\yallist\
100%        New File                 207        iterator.js
100%        New File                 765        LICENSE
100%        New File                 652        package.json
100%        New File                4717        README.md
100%        New File                8411        yallist.js

------------------------------------------------------------------------------

               Total    Copied   Skipped  Mismatch    FAILED    Extras
    Dirs :       185       185         0         0         0         0
   Files :       808       808         0         0         0         0
   Bytes :    2.96 m    2.96 m         0         0         0         0
   Times :   0:00:03   0:00:01                       0:00:00   0:00:01


   Speed :           1,722,919 Bytes/sec.
   Speed :              98.586 MegaBytes/min.
   Ended : Sunday, May 5, 2024 9:15:58 PM

------------------------------------------------------------------------------
//Dodawanie zmian do śledzenia w repozytorium
C:\Users\anastasiia\pawcho6\PAwChO_lab5>git add .

------------------------------------------------------------------------------
//Tworzenie commita
C:\Users\anastasiia\pawcho6\PAwChO_lab5>git commit -m "Dodano rozwiązanie z lab5"

[main c6c615e] Dodano rozwiązanie z lab5
 808 files changed, 93356 insertions(+)
 create mode 100644 PAwChO_lab5/Dockerfile4_2
 create mode 100644 PAwChO_lab5/kod.js
 create mode 100644 PAwChO_lab5/node_modules/.bin/mime
 create mode 100644 PAwChO_lab5/node_modules/.bin/mime.cmd
 create mode 100644 PAwChO_lab5/node_modules/.bin/mime.ps1
 create mode 100644 PAwChO_lab5/node_modules/.bin/nodemon
 create mode 100644 PAwChO_lab5/node_modules/.bin/nodemon.cmd
 create mode 100644 PAwChO_lab5/node_modules/.bin/nodemon.ps1
 create mode 100644 PAwChO_lab5/node_modules/.bin/nodetouch
 create mode 100644 PAwChO_lab5/node_modules/.bin/nodetouch.cmd
 create mode 100644 PAwChO_lab5/node_modules/.bin/nodetouch.ps1
 create mode 100644 PAwChO_lab5/node_modules/.bin/nopt
 create mode 100644 PAwChO_lab5/node_modules/.bin/nopt.cmd
 create mode 100644 PAwChO_lab5/node_modules/.bin/nopt.ps1
 create mode 100644 PAwChO_lab5/node_modules/.bin/semver
 create mode 100644 PAwChO_lab5/node_modules/.bin/semver.cmd
 create mode 100644 PAwChO_lab5/node_modules/.bin/semver.ps1
 create mode 100644 PAwChO_lab5/node_modules/.package-lock.json
 create mode 100644 PAwChO_lab5/node_modules/abbrev/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/abbrev/README.md
 create mode 100644 PAwChO_lab5/node_modules/abbrev/abbrev.js
 create mode 100644 PAwChO_lab5/node_modules/abbrev/package.json
 create mode 100644 PAwChO_lab5/node_modules/accepts/HISTORY.md
 create mode 100644 PAwChO_lab5/node_modules/accepts/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/accepts/README.md
 create mode 100644 PAwChO_lab5/node_modules/accepts/index.js
 create mode 100644 PAwChO_lab5/node_modules/accepts/package.json
 create mode 100644 PAwChO_lab5/node_modules/anymatch/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/anymatch/README.md
 create mode 100644 PAwChO_lab5/node_modules/anymatch/index.d.ts
 create mode 100644 PAwChO_lab5/node_modules/anymatch/index.js
 create mode 100644 PAwChO_lab5/node_modules/anymatch/package.json
 create mode 100644 PAwChO_lab5/node_modules/array-flatten/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/array-flatten/README.md
 create mode 100644 PAwChO_lab5/node_modules/array-flatten/array-flatten.js
 create mode 100644 PAwChO_lab5/node_modules/array-flatten/package.json
 create mode 100644 PAwChO_lab5/node_modules/balanced-match/.github/FUNDING.yml
 create mode 100644 PAwChO_lab5/node_modules/balanced-match/LICENSE.md
 create mode 100644 PAwChO_lab5/node_modules/balanced-match/README.md
 create mode 100644 PAwChO_lab5/node_modules/balanced-match/index.js
 create mode 100644 PAwChO_lab5/node_modules/balanced-match/package.json
 create mode 100644 PAwChO_lab5/node_modules/binary-extensions/binary-extensions.json
 create mode 100644 PAwChO_lab5/node_modules/binary-extensions/binary-extensions.json.d.ts
 create mode 100644 PAwChO_lab5/node_modules/binary-extensions/index.d.ts
 create mode 100644 PAwChO_lab5/node_modules/binary-extensions/index.js
 create mode 100644 PAwChO_lab5/node_modules/binary-extensions/license
 create mode 100644 PAwChO_lab5/node_modules/binary-extensions/package.json
 create mode 100644 PAwChO_lab5/node_modules/binary-extensions/readme.md
 create mode 100644 PAwChO_lab5/node_modules/body-parser/HISTORY.md
 create mode 100644 PAwChO_lab5/node_modules/body-parser/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/body-parser/README.md
 create mode 100644 PAwChO_lab5/node_modules/body-parser/SECURITY.md
 create mode 100644 PAwChO_lab5/node_modules/body-parser/index.js
 create mode 100644 PAwChO_lab5/node_modules/body-parser/lib/read.js
 create mode 100644 PAwChO_lab5/node_modules/body-parser/lib/types/json.js
 create mode 100644 PAwChO_lab5/node_modules/body-parser/lib/types/raw.js
 create mode 100644 PAwChO_lab5/node_modules/body-parser/lib/types/text.js
 create mode 100644 PAwChO_lab5/node_modules/body-parser/lib/types/urlencoded.js
 create mode 100644 PAwChO_lab5/node_modules/body-parser/package.json
 create mode 100644 PAwChO_lab5/node_modules/brace-expansion/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/brace-expansion/README.md
 create mode 100644 PAwChO_lab5/node_modules/brace-expansion/index.js
 create mode 100644 PAwChO_lab5/node_modules/brace-expansion/package.json
 create mode 100644 PAwChO_lab5/node_modules/braces/CHANGELOG.md
 create mode 100644 PAwChO_lab5/node_modules/braces/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/braces/README.md
 create mode 100644 PAwChO_lab5/node_modules/braces/index.js
 create mode 100644 PAwChO_lab5/node_modules/braces/lib/compile.js
 create mode 100644 PAwChO_lab5/node_modules/braces/lib/constants.js
 create mode 100644 PAwChO_lab5/node_modules/braces/lib/expand.js
 create mode 100644 PAwChO_lab5/node_modules/braces/lib/parse.js
 create mode 100644 PAwChO_lab5/node_modules/braces/lib/stringify.js
 create mode 100644 PAwChO_lab5/node_modules/braces/lib/utils.js
 create mode 100644 PAwChO_lab5/node_modules/braces/package.json
 create mode 100644 PAwChO_lab5/node_modules/bytes/History.md
 create mode 100644 PAwChO_lab5/node_modules/bytes/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/bytes/Readme.md
 create mode 100644 PAwChO_lab5/node_modules/bytes/index.js
 create mode 100644 PAwChO_lab5/node_modules/bytes/package.json
 create mode 100644 PAwChO_lab5/node_modules/call-bind/.eslintignore
 create mode 100644 PAwChO_lab5/node_modules/call-bind/.eslintrc
 create mode 100644 PAwChO_lab5/node_modules/call-bind/.github/FUNDING.yml
 create mode 100644 PAwChO_lab5/node_modules/call-bind/.nycrc
 create mode 100644 PAwChO_lab5/node_modules/call-bind/CHANGELOG.md
 create mode 100644 PAwChO_lab5/node_modules/call-bind/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/call-bind/README.md
 create mode 100644 PAwChO_lab5/node_modules/call-bind/callBound.js
 create mode 100644 PAwChO_lab5/node_modules/call-bind/index.js
 create mode 100644 PAwChO_lab5/node_modules/call-bind/package.json
 create mode 100644 PAwChO_lab5/node_modules/call-bind/test/callBound.js
 create mode 100644 PAwChO_lab5/node_modules/call-bind/test/index.js
 create mode 100644 PAwChO_lab5/node_modules/chokidar/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/chokidar/README.md
 create mode 100644 PAwChO_lab5/node_modules/chokidar/index.js
 create mode 100644 PAwChO_lab5/node_modules/chokidar/lib/constants.js
 create mode 100644 PAwChO_lab5/node_modules/chokidar/lib/fsevents-handler.js
 create mode 100644 PAwChO_lab5/node_modules/chokidar/lib/nodefs-handler.js
 create mode 100644 PAwChO_lab5/node_modules/chokidar/package.json
 create mode 100644 PAwChO_lab5/node_modules/chokidar/types/index.d.ts
 create mode 100644 PAwChO_lab5/node_modules/concat-map/.travis.yml
 create mode 100644 PAwChO_lab5/node_modules/concat-map/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/concat-map/README.markdown
 create mode 100644 PAwChO_lab5/node_modules/concat-map/example/map.js
 create mode 100644 PAwChO_lab5/node_modules/concat-map/index.js
 create mode 100644 PAwChO_lab5/node_modules/concat-map/package.json
 create mode 100644 PAwChO_lab5/node_modules/concat-map/test/map.js
 create mode 100644 PAwChO_lab5/node_modules/content-disposition/HISTORY.md
 create mode 100644 PAwChO_lab5/node_modules/content-disposition/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/content-disposition/README.md
 create mode 100644 PAwChO_lab5/node_modules/content-disposition/index.js
 create mode 100644 PAwChO_lab5/node_modules/content-disposition/package.json
 create mode 100644 PAwChO_lab5/node_modules/content-type/HISTORY.md
 create mode 100644 PAwChO_lab5/node_modules/content-type/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/content-type/README.md
 create mode 100644 PAwChO_lab5/node_modules/content-type/index.js
 create mode 100644 PAwChO_lab5/node_modules/content-type/package.json
 create mode 100644 PAwChO_lab5/node_modules/cookie-signature/.npmignore
 create mode 100644 PAwChO_lab5/node_modules/cookie-signature/History.md
 create mode 100644 PAwChO_lab5/node_modules/cookie-signature/Readme.md
 create mode 100644 PAwChO_lab5/node_modules/cookie-signature/index.js
 create mode 100644 PAwChO_lab5/node_modules/cookie-signature/package.json
 create mode 100644 PAwChO_lab5/node_modules/cookie/HISTORY.md
 create mode 100644 PAwChO_lab5/node_modules/cookie/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/cookie/README.md
 create mode 100644 PAwChO_lab5/node_modules/cookie/SECURITY.md
 create mode 100644 PAwChO_lab5/node_modules/cookie/index.js
 create mode 100644 PAwChO_lab5/node_modules/cookie/package.json
 create mode 100644 PAwChO_lab5/node_modules/debug/.coveralls.yml
 create mode 100644 PAwChO_lab5/node_modules/debug/.eslintrc
 create mode 100644 PAwChO_lab5/node_modules/debug/.npmignore
 create mode 100644 PAwChO_lab5/node_modules/debug/.travis.yml
 create mode 100644 PAwChO_lab5/node_modules/debug/CHANGELOG.md
 create mode 100644 PAwChO_lab5/node_modules/debug/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/debug/Makefile
 create mode 100644 PAwChO_lab5/node_modules/debug/README.md
 create mode 100644 PAwChO_lab5/node_modules/debug/component.json
 create mode 100644 PAwChO_lab5/node_modules/debug/karma.conf.js
 create mode 100644 PAwChO_lab5/node_modules/debug/node.js
 create mode 100644 PAwChO_lab5/node_modules/debug/package.json
 create mode 100644 PAwChO_lab5/node_modules/debug/src/browser.js
 create mode 100644 PAwChO_lab5/node_modules/debug/src/debug.js
 create mode 100644 PAwChO_lab5/node_modules/debug/src/index.js
 create mode 100644 PAwChO_lab5/node_modules/debug/src/inspector-log.js
 create mode 100644 PAwChO_lab5/node_modules/debug/src/node.js
 create mode 100644 PAwChO_lab5/node_modules/define-data-property/.eslintrc
 create mode 100644 PAwChO_lab5/node_modules/define-data-property/.github/FUNDING.yml
 create mode 100644 PAwChO_lab5/node_modules/define-data-property/.nycrc
 create mode 100644 PAwChO_lab5/node_modules/define-data-property/CHANGELOG.md
 create mode 100644 PAwChO_lab5/node_modules/define-data-property/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/define-data-property/README.md
 create mode 100644 PAwChO_lab5/node_modules/define-data-property/index.d.ts
 create mode 100644 PAwChO_lab5/node_modules/define-data-property/index.js
 create mode 100644 PAwChO_lab5/node_modules/define-data-property/package.json
 create mode 100644 PAwChO_lab5/node_modules/define-data-property/test/index.js
 create mode 100644 PAwChO_lab5/node_modules/define-data-property/tsconfig.json
 create mode 100644 PAwChO_lab5/node_modules/depd/History.md
 create mode 100644 PAwChO_lab5/node_modules/depd/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/depd/Readme.md
 create mode 100644 PAwChO_lab5/node_modules/depd/index.js
 create mode 100644 PAwChO_lab5/node_modules/depd/lib/browser/index.js
 create mode 100644 PAwChO_lab5/node_modules/depd/package.json
 create mode 100644 PAwChO_lab5/node_modules/destroy/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/destroy/README.md
 create mode 100644 PAwChO_lab5/node_modules/destroy/index.js
 create mode 100644 PAwChO_lab5/node_modules/destroy/package.json
 create mode 100644 PAwChO_lab5/node_modules/ee-first/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/ee-first/README.md
 create mode 100644 PAwChO_lab5/node_modules/ee-first/index.js
 create mode 100644 PAwChO_lab5/node_modules/ee-first/package.json
 create mode 100644 PAwChO_lab5/node_modules/encodeurl/HISTORY.md
 create mode 100644 PAwChO_lab5/node_modules/encodeurl/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/encodeurl/README.md
 create mode 100644 PAwChO_lab5/node_modules/encodeurl/index.js
 create mode 100644 PAwChO_lab5/node_modules/encodeurl/package.json
 create mode 100644 PAwChO_lab5/node_modules/es-define-property/.eslintrc
 create mode 100644 PAwChO_lab5/node_modules/es-define-property/.github/FUNDING.yml
 create mode 100644 PAwChO_lab5/node_modules/es-define-property/.nycrc
 create mode 100644 PAwChO_lab5/node_modules/es-define-property/CHANGELOG.md
 create mode 100644 PAwChO_lab5/node_modules/es-define-property/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/es-define-property/README.md
 create mode 100644 PAwChO_lab5/node_modules/es-define-property/index.d.ts
 create mode 100644 PAwChO_lab5/node_modules/es-define-property/index.js
 create mode 100644 PAwChO_lab5/node_modules/es-define-property/package.json
 create mode 100644 PAwChO_lab5/node_modules/es-define-property/test/index.js
 create mode 100644 PAwChO_lab5/node_modules/es-define-property/tsconfig.json
 create mode 100644 PAwChO_lab5/node_modules/es-errors/.eslintrc
 create mode 100644 PAwChO_lab5/node_modules/es-errors/.github/FUNDING.yml
 create mode 100644 PAwChO_lab5/node_modules/es-errors/CHANGELOG.md
 create mode 100644 PAwChO_lab5/node_modules/es-errors/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/es-errors/README.md
 create mode 100644 PAwChO_lab5/node_modules/es-errors/eval.d.ts
 create mode 100644 PAwChO_lab5/node_modules/es-errors/eval.js
 create mode 100644 PAwChO_lab5/node_modules/es-errors/index.d.ts
 create mode 100644 PAwChO_lab5/node_modules/es-errors/index.js
 create mode 100644 PAwChO_lab5/node_modules/es-errors/package.json
 create mode 100644 PAwChO_lab5/node_modules/es-errors/range.d.ts
 create mode 100644 PAwChO_lab5/node_modules/es-errors/range.js
 create mode 100644 PAwChO_lab5/node_modules/es-errors/ref.d.ts
 create mode 100644 PAwChO_lab5/node_modules/es-errors/ref.js
 create mode 100644 PAwChO_lab5/node_modules/es-errors/syntax.d.ts
 create mode 100644 PAwChO_lab5/node_modules/es-errors/syntax.js
 create mode 100644 PAwChO_lab5/node_modules/es-errors/test/index.js
 create mode 100644 PAwChO_lab5/node_modules/es-errors/tsconfig.json
 create mode 100644 PAwChO_lab5/node_modules/es-errors/type.d.ts
 create mode 100644 PAwChO_lab5/node_modules/es-errors/type.js
 create mode 100644 PAwChO_lab5/node_modules/es-errors/uri.d.ts
 create mode 100644 PAwChO_lab5/node_modules/es-errors/uri.js
 create mode 100644 PAwChO_lab5/node_modules/escape-html/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/escape-html/Readme.md
 create mode 100644 PAwChO_lab5/node_modules/escape-html/index.js
 create mode 100644 PAwChO_lab5/node_modules/escape-html/package.json
 create mode 100644 PAwChO_lab5/node_modules/etag/HISTORY.md
 create mode 100644 PAwChO_lab5/node_modules/etag/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/etag/README.md
 create mode 100644 PAwChO_lab5/node_modules/etag/index.js
 create mode 100644 PAwChO_lab5/node_modules/etag/package.json
 create mode 100644 PAwChO_lab5/node_modules/express/History.md
 create mode 100644 PAwChO_lab5/node_modules/express/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/express/Readme.md
 create mode 100644 PAwChO_lab5/node_modules/express/index.js
 create mode 100644 PAwChO_lab5/node_modules/express/lib/application.js
 create mode 100644 PAwChO_lab5/node_modules/express/lib/express.js
 create mode 100644 PAwChO_lab5/node_modules/express/lib/middleware/init.js
 create mode 100644 PAwChO_lab5/node_modules/express/lib/middleware/query.js
 create mode 100644 PAwChO_lab5/node_modules/express/lib/request.js
 create mode 100644 PAwChO_lab5/node_modules/express/lib/response.js
 create mode 100644 PAwChO_lab5/node_modules/express/lib/router/index.js
 create mode 100644 PAwChO_lab5/node_modules/express/lib/router/layer.js
 create mode 100644 PAwChO_lab5/node_modules/express/lib/router/route.js
 create mode 100644 PAwChO_lab5/node_modules/express/lib/utils.js
 create mode 100644 PAwChO_lab5/node_modules/express/lib/view.js
 create mode 100644 PAwChO_lab5/node_modules/express/package.json
 create mode 100644 PAwChO_lab5/node_modules/fill-range/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/fill-range/README.md
 create mode 100644 PAwChO_lab5/node_modules/fill-range/index.js
 create mode 100644 PAwChO_lab5/node_modules/fill-range/package.json
 create mode 100644 PAwChO_lab5/node_modules/finalhandler/HISTORY.md
 create mode 100644 PAwChO_lab5/node_modules/finalhandler/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/finalhandler/README.md
 create mode 100644 PAwChO_lab5/node_modules/finalhandler/SECURITY.md
 create mode 100644 PAwChO_lab5/node_modules/finalhandler/index.js
 create mode 100644 PAwChO_lab5/node_modules/finalhandler/package.json
 create mode 100644 PAwChO_lab5/node_modules/forwarded/HISTORY.md
 create mode 100644 PAwChO_lab5/node_modules/forwarded/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/forwarded/README.md
 create mode 100644 PAwChO_lab5/node_modules/forwarded/index.js
 create mode 100644 PAwChO_lab5/node_modules/forwarded/package.json
 create mode 100644 PAwChO_lab5/node_modules/fresh/HISTORY.md
 create mode 100644 PAwChO_lab5/node_modules/fresh/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/fresh/README.md
 create mode 100644 PAwChO_lab5/node_modules/fresh/index.js
 create mode 100644 PAwChO_lab5/node_modules/fresh/package.json
 create mode 100644 PAwChO_lab5/node_modules/function-bind/.eslintrc
 create mode 100644 PAwChO_lab5/node_modules/function-bind/.github/FUNDING.yml
 create mode 100644 PAwChO_lab5/node_modules/function-bind/.github/SECURITY.md
 create mode 100644 PAwChO_lab5/node_modules/function-bind/.nycrc
 create mode 100644 PAwChO_lab5/node_modules/function-bind/CHANGELOG.md
 create mode 100644 PAwChO_lab5/node_modules/function-bind/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/function-bind/README.md
 create mode 100644 PAwChO_lab5/node_modules/function-bind/implementation.js
 create mode 100644 PAwChO_lab5/node_modules/function-bind/index.js
 create mode 100644 PAwChO_lab5/node_modules/function-bind/package.json
 create mode 100644 PAwChO_lab5/node_modules/function-bind/test/.eslintrc
 create mode 100644 PAwChO_lab5/node_modules/function-bind/test/index.js
 create mode 100644 PAwChO_lab5/node_modules/get-intrinsic/.eslintrc
 create mode 100644 PAwChO_lab5/node_modules/get-intrinsic/.github/FUNDING.yml
 create mode 100644 PAwChO_lab5/node_modules/get-intrinsic/.nycrc
 create mode 100644 PAwChO_lab5/node_modules/get-intrinsic/CHANGELOG.md
 create mode 100644 PAwChO_lab5/node_modules/get-intrinsic/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/get-intrinsic/README.md
 create mode 100644 PAwChO_lab5/node_modules/get-intrinsic/index.js
 create mode 100644 PAwChO_lab5/node_modules/get-intrinsic/package.json
 create mode 100644 PAwChO_lab5/node_modules/get-intrinsic/test/GetIntrinsic.js
 create mode 100644 PAwChO_lab5/node_modules/glob-parent/CHANGELOG.md
 create mode 100644 PAwChO_lab5/node_modules/glob-parent/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/glob-parent/README.md
 create mode 100644 PAwChO_lab5/node_modules/glob-parent/index.js
 create mode 100644 PAwChO_lab5/node_modules/glob-parent/package.json
 create mode 100644 PAwChO_lab5/node_modules/gopd/.eslintrc
 create mode 100644 PAwChO_lab5/node_modules/gopd/.github/FUNDING.yml
 create mode 100644 PAwChO_lab5/node_modules/gopd/CHANGELOG.md
 create mode 100644 PAwChO_lab5/node_modules/gopd/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/gopd/README.md
 create mode 100644 PAwChO_lab5/node_modules/gopd/index.js
 create mode 100644 PAwChO_lab5/node_modules/gopd/package.json
 create mode 100644 PAwChO_lab5/node_modules/gopd/test/index.js
 create mode 100644 PAwChO_lab5/node_modules/has-flag/index.js
 create mode 100644 PAwChO_lab5/node_modules/has-flag/license
 create mode 100644 PAwChO_lab5/node_modules/has-flag/package.json
 create mode 100644 PAwChO_lab5/node_modules/has-flag/readme.md
 create mode 100644 PAwChO_lab5/node_modules/has-property-descriptors/.eslintrc
 create mode 100644 PAwChO_lab5/node_modules/has-property-descriptors/.github/FUNDING.yml
 create mode 100644 PAwChO_lab5/node_modules/has-property-descriptors/.nycrc
 create mode 100644 PAwChO_lab5/node_modules/has-property-descriptors/CHANGELOG.md
 create mode 100644 PAwChO_lab5/node_modules/has-property-descriptors/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/has-property-descriptors/README.md
 create mode 100644 PAwChO_lab5/node_modules/has-property-descriptors/index.js
 create mode 100644 PAwChO_lab5/node_modules/has-property-descriptors/package.json
 create mode 100644 PAwChO_lab5/node_modules/has-property-descriptors/test/index.js
 create mode 100644 PAwChO_lab5/node_modules/has-proto/.eslintrc
 create mode 100644 PAwChO_lab5/node_modules/has-proto/.github/FUNDING.yml
 create mode 100644 PAwChO_lab5/node_modules/has-proto/CHANGELOG.md
 create mode 100644 PAwChO_lab5/node_modules/has-proto/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/has-proto/README.md
 create mode 100644 PAwChO_lab5/node_modules/has-proto/index.d.ts
 create mode 100644 PAwChO_lab5/node_modules/has-proto/index.js
 create mode 100644 PAwChO_lab5/node_modules/has-proto/package.json
 create mode 100644 PAwChO_lab5/node_modules/has-proto/test/index.js
 create mode 100644 PAwChO_lab5/node_modules/has-proto/tsconfig.json
 create mode 100644 PAwChO_lab5/node_modules/has-symbols/.eslintrc
 create mode 100644 PAwChO_lab5/node_modules/has-symbols/.github/FUNDING.yml
 create mode 100644 PAwChO_lab5/node_modules/has-symbols/.nycrc
 create mode 100644 PAwChO_lab5/node_modules/has-symbols/CHANGELOG.md
 create mode 100644 PAwChO_lab5/node_modules/has-symbols/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/has-symbols/README.md
 create mode 100644 PAwChO_lab5/node_modules/has-symbols/index.js
 create mode 100644 PAwChO_lab5/node_modules/has-symbols/package.json
 create mode 100644 PAwChO_lab5/node_modules/has-symbols/shams.js
 create mode 100644 PAwChO_lab5/node_modules/has-symbols/test/index.js
 create mode 100644 PAwChO_lab5/node_modules/has-symbols/test/shams/core-js.js
 create mode 100644 PAwChO_lab5/node_modules/has-symbols/test/shams/get-own-property-symbols.js
 create mode 100644 PAwChO_lab5/node_modules/has-symbols/test/tests.js
 create mode 100644 PAwChO_lab5/node_modules/hasown/.eslintrc
 create mode 100644 PAwChO_lab5/node_modules/hasown/.github/FUNDING.yml
 create mode 100644 PAwChO_lab5/node_modules/hasown/.nycrc
 create mode 100644 PAwChO_lab5/node_modules/hasown/CHANGELOG.md
 create mode 100644 PAwChO_lab5/node_modules/hasown/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/hasown/README.md
 create mode 100644 PAwChO_lab5/node_modules/hasown/index.d.ts
 create mode 100644 PAwChO_lab5/node_modules/hasown/index.js
 create mode 100644 PAwChO_lab5/node_modules/hasown/package.json
 create mode 100644 PAwChO_lab5/node_modules/hasown/tsconfig.json
 create mode 100644 PAwChO_lab5/node_modules/http-errors/HISTORY.md
 create mode 100644 PAwChO_lab5/node_modules/http-errors/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/http-errors/README.md
 create mode 100644 PAwChO_lab5/node_modules/http-errors/index.js
 create mode 100644 PAwChO_lab5/node_modules/http-errors/package.json
 create mode 100644 PAwChO_lab5/node_modules/iconv-lite/Changelog.md
 create mode 100644 PAwChO_lab5/node_modules/iconv-lite/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/iconv-lite/README.md
 create mode 100644 PAwChO_lab5/node_modules/iconv-lite/encodings/dbcs-codec.js
 create mode 100644 PAwChO_lab5/node_modules/iconv-lite/encodings/dbcs-data.js
 create mode 100644 PAwChO_lab5/node_modules/iconv-lite/encodings/index.js
 create mode 100644 PAwChO_lab5/node_modules/iconv-lite/encodings/internal.js
 create mode 100644 PAwChO_lab5/node_modules/iconv-lite/encodings/sbcs-codec.js
 create mode 100644 PAwChO_lab5/node_modules/iconv-lite/encodings/sbcs-data-generated.js
 create mode 100644 PAwChO_lab5/node_modules/iconv-lite/encodings/sbcs-data.js
 create mode 100644 PAwChO_lab5/node_modules/iconv-lite/encodings/tables/big5-added.json
 create mode 100644 PAwChO_lab5/node_modules/iconv-lite/encodings/tables/cp936.json
 create mode 100644 PAwChO_lab5/node_modules/iconv-lite/encodings/tables/cp949.json
 create mode 100644 PAwChO_lab5/node_modules/iconv-lite/encodings/tables/cp950.json
 create mode 100644 PAwChO_lab5/node_modules/iconv-lite/encodings/tables/eucjp.json
 create mode 100644 PAwChO_lab5/node_modules/iconv-lite/encodings/tables/gb18030-ranges.json
 create mode 100644 PAwChO_lab5/node_modules/iconv-lite/encodings/tables/gbk-added.json
 create mode 100644 PAwChO_lab5/node_modules/iconv-lite/encodings/tables/shiftjis.json
 create mode 100644 PAwChO_lab5/node_modules/iconv-lite/encodings/utf16.js
 create mode 100644 PAwChO_lab5/node_modules/iconv-lite/encodings/utf7.js
 create mode 100644 PAwChO_lab5/node_modules/iconv-lite/lib/bom-handling.js
 create mode 100644 PAwChO_lab5/node_modules/iconv-lite/lib/extend-node.js
 create mode 100644 PAwChO_lab5/node_modules/iconv-lite/lib/index.d.ts
 create mode 100644 PAwChO_lab5/node_modules/iconv-lite/lib/index.js
 create mode 100644 PAwChO_lab5/node_modules/iconv-lite/lib/streams.js
 create mode 100644 PAwChO_lab5/node_modules/iconv-lite/package.json
 create mode 100644 PAwChO_lab5/node_modules/ignore-by-default/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/ignore-by-default/README.md
 create mode 100644 PAwChO_lab5/node_modules/ignore-by-default/index.js
 create mode 100644 PAwChO_lab5/node_modules/ignore-by-default/package.json
 create mode 100644 PAwChO_lab5/node_modules/inherits/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/inherits/README.md
 create mode 100644 PAwChO_lab5/node_modules/inherits/inherits.js
 create mode 100644 PAwChO_lab5/node_modules/inherits/inherits_browser.js
 create mode 100644 PAwChO_lab5/node_modules/inherits/package.json
 create mode 100644 PAwChO_lab5/node_modules/ipaddr.js/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/ipaddr.js/README.md
 create mode 100644 PAwChO_lab5/node_modules/ipaddr.js/ipaddr.min.js
 create mode 100644 PAwChO_lab5/node_modules/ipaddr.js/lib/ipaddr.js
 create mode 100644 PAwChO_lab5/node_modules/ipaddr.js/lib/ipaddr.js.d.ts
 create mode 100644 PAwChO_lab5/node_modules/ipaddr.js/package.json
 create mode 100644 PAwChO_lab5/node_modules/is-binary-path/index.d.ts
 create mode 100644 PAwChO_lab5/node_modules/is-binary-path/index.js
 create mode 100644 PAwChO_lab5/node_modules/is-binary-path/license
 create mode 100644 PAwChO_lab5/node_modules/is-binary-path/package.json
 create mode 100644 PAwChO_lab5/node_modules/is-binary-path/readme.md
 create mode 100644 PAwChO_lab5/node_modules/is-extglob/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/is-extglob/README.md
 create mode 100644 PAwChO_lab5/node_modules/is-extglob/index.js
 create mode 100644 PAwChO_lab5/node_modules/is-extglob/package.json
 create mode 100644 PAwChO_lab5/node_modules/is-glob/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/is-glob/README.md
 create mode 100644 PAwChO_lab5/node_modules/is-glob/index.js
 create mode 100644 PAwChO_lab5/node_modules/is-glob/package.json
 create mode 100644 PAwChO_lab5/node_modules/is-number/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/is-number/README.md
 create mode 100644 PAwChO_lab5/node_modules/is-number/index.js
 create mode 100644 PAwChO_lab5/node_modules/is-number/package.json
 create mode 100644 PAwChO_lab5/node_modules/lru-cache/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/lru-cache/README.md
 create mode 100644 PAwChO_lab5/node_modules/lru-cache/index.js
 create mode 100644 PAwChO_lab5/node_modules/lru-cache/package.json
 create mode 100644 PAwChO_lab5/node_modules/media-typer/HISTORY.md
 create mode 100644 PAwChO_lab5/node_modules/media-typer/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/media-typer/README.md
 create mode 100644 PAwChO_lab5/node_modules/media-typer/index.js
 create mode 100644 PAwChO_lab5/node_modules/media-typer/package.json
 create mode 100644 PAwChO_lab5/node_modules/merge-descriptors/HISTORY.md
 create mode 100644 PAwChO_lab5/node_modules/merge-descriptors/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/merge-descriptors/README.md
 create mode 100644 PAwChO_lab5/node_modules/merge-descriptors/index.js
 create mode 100644 PAwChO_lab5/node_modules/merge-descriptors/package.json
 create mode 100644 PAwChO_lab5/node_modules/methods/HISTORY.md
 create mode 100644 PAwChO_lab5/node_modules/methods/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/methods/README.md
 create mode 100644 PAwChO_lab5/node_modules/methods/index.js
 create mode 100644 PAwChO_lab5/node_modules/methods/package.json
 create mode 100644 PAwChO_lab5/node_modules/mime-db/HISTORY.md
 create mode 100644 PAwChO_lab5/node_modules/mime-db/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/mime-db/README.md
 create mode 100644 PAwChO_lab5/node_modules/mime-db/db.json
 create mode 100644 PAwChO_lab5/node_modules/mime-db/index.js
 create mode 100644 PAwChO_lab5/node_modules/mime-db/package.json
 create mode 100644 PAwChO_lab5/node_modules/mime-types/HISTORY.md
 create mode 100644 PAwChO_lab5/node_modules/mime-types/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/mime-types/README.md
 create mode 100644 PAwChO_lab5/node_modules/mime-types/index.js
 create mode 100644 PAwChO_lab5/node_modules/mime-types/package.json
 create mode 100644 PAwChO_lab5/node_modules/mime/.npmignore
 create mode 100644 PAwChO_lab5/node_modules/mime/CHANGELOG.md
 create mode 100644 PAwChO_lab5/node_modules/mime/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/mime/README.md
 create mode 100644 PAwChO_lab5/node_modules/mime/cli.js
 create mode 100644 PAwChO_lab5/node_modules/mime/mime.js
 create mode 100644 PAwChO_lab5/node_modules/mime/package.json
 create mode 100644 PAwChO_lab5/node_modules/mime/src/build.js
 create mode 100644 PAwChO_lab5/node_modules/mime/src/test.js
 create mode 100644 PAwChO_lab5/node_modules/mime/types.json
 create mode 100644 PAwChO_lab5/node_modules/minimatch/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/minimatch/README.md
 create mode 100644 PAwChO_lab5/node_modules/minimatch/minimatch.js
 create mode 100644 PAwChO_lab5/node_modules/minimatch/package.json
 create mode 100644 PAwChO_lab5/node_modules/ms/index.js
 create mode 100644 PAwChO_lab5/node_modules/ms/license.md
 create mode 100644 PAwChO_lab5/node_modules/ms/package.json
 create mode 100644 PAwChO_lab5/node_modules/ms/readme.md
 create mode 100644 PAwChO_lab5/node_modules/negotiator/HISTORY.md
 create mode 100644 PAwChO_lab5/node_modules/negotiator/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/negotiator/README.md
 create mode 100644 PAwChO_lab5/node_modules/negotiator/index.js
 create mode 100644 PAwChO_lab5/node_modules/negotiator/lib/charset.js
 create mode 100644 PAwChO_lab5/node_modules/negotiator/lib/encoding.js
 create mode 100644 PAwChO_lab5/node_modules/negotiator/lib/language.js
 create mode 100644 PAwChO_lab5/node_modules/negotiator/lib/mediaType.js
 create mode 100644 PAwChO_lab5/node_modules/negotiator/package.json
 create mode 100644 PAwChO_lab5/node_modules/nodemon/.prettierrc.json
 create mode 100644 PAwChO_lab5/node_modules/nodemon/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/nodemon/README.md
 create mode 100644 PAwChO_lab5/node_modules/nodemon/bin/nodemon.js
 create mode 100644 PAwChO_lab5/node_modules/nodemon/bin/windows-kill.exe
 create mode 100644 PAwChO_lab5/node_modules/nodemon/doc/cli/authors.txt
 create mode 100644 PAwChO_lab5/node_modules/nodemon/doc/cli/config.txt
 create mode 100644 PAwChO_lab5/node_modules/nodemon/doc/cli/help.txt
 create mode 100644 PAwChO_lab5/node_modules/nodemon/doc/cli/logo.txt
 create mode 100644 PAwChO_lab5/node_modules/nodemon/doc/cli/options.txt
 create mode 100644 PAwChO_lab5/node_modules/nodemon/doc/cli/topics.txt
 create mode 100644 PAwChO_lab5/node_modules/nodemon/doc/cli/usage.txt
 create mode 100644 PAwChO_lab5/node_modules/nodemon/doc/cli/whoami.txt
 create mode 100644 PAwChO_lab5/node_modules/nodemon/lib/cli/index.js
 create mode 100644 PAwChO_lab5/node_modules/nodemon/lib/cli/parse.js
 create mode 100644 PAwChO_lab5/node_modules/nodemon/lib/config/command.js
 create mode 100644 PAwChO_lab5/node_modules/nodemon/lib/config/defaults.js
 create mode 100644 PAwChO_lab5/node_modules/nodemon/lib/config/exec.js
 create mode 100644 PAwChO_lab5/node_modules/nodemon/lib/config/index.js
 create mode 100644 PAwChO_lab5/node_modules/nodemon/lib/config/load.js
 create mode 100644 PAwChO_lab5/node_modules/nodemon/lib/help/index.js
 create mode 100644 PAwChO_lab5/node_modules/nodemon/lib/index.js
 create mode 100644 PAwChO_lab5/node_modules/nodemon/lib/monitor/index.js
 create mode 100644 PAwChO_lab5/node_modules/nodemon/lib/monitor/match.js
 create mode 100644 PAwChO_lab5/node_modules/nodemon/lib/monitor/run.js
 create mode 100644 PAwChO_lab5/node_modules/nodemon/lib/monitor/signals.js
 create mode 100644 PAwChO_lab5/node_modules/nodemon/lib/monitor/watch.js
 create mode 100644 PAwChO_lab5/node_modules/nodemon/lib/nodemon.js
 create mode 100644 PAwChO_lab5/node_modules/nodemon/lib/rules/add.js
 create mode 100644 PAwChO_lab5/node_modules/nodemon/lib/rules/index.js
 create mode 100644 PAwChO_lab5/node_modules/nodemon/lib/rules/parse.js
 create mode 100644 PAwChO_lab5/node_modules/nodemon/lib/spawn.js
 create mode 100644 PAwChO_lab5/node_modules/nodemon/lib/utils/bus.js
 create mode 100644 PAwChO_lab5/node_modules/nodemon/lib/utils/clone.js
 create mode 100644 PAwChO_lab5/node_modules/nodemon/lib/utils/colour.js
 create mode 100644 PAwChO_lab5/node_modules/nodemon/lib/utils/index.js
 create mode 100644 PAwChO_lab5/node_modules/nodemon/lib/utils/log.js
 create mode 100644 PAwChO_lab5/node_modules/nodemon/lib/utils/merge.js
 create mode 100644 PAwChO_lab5/node_modules/nodemon/lib/version.js
 create mode 100644 PAwChO_lab5/node_modules/nodemon/node_modules/debug/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/nodemon/node_modules/debug/README.md
 create mode 100644 PAwChO_lab5/node_modules/nodemon/node_modules/debug/package.json
 create mode 100644 PAwChO_lab5/node_modules/nodemon/node_modules/debug/src/browser.js
 create mode 100644 PAwChO_lab5/node_modules/nodemon/node_modules/debug/src/common.js
 create mode 100644 PAwChO_lab5/node_modules/nodemon/node_modules/debug/src/index.js
 create mode 100644 PAwChO_lab5/node_modules/nodemon/node_modules/debug/src/node.js
 create mode 100644 PAwChO_lab5/node_modules/nodemon/node_modules/ms/index.js
 create mode 100644 PAwChO_lab5/node_modules/nodemon/node_modules/ms/license.md
 create mode 100644 PAwChO_lab5/node_modules/nodemon/node_modules/ms/package.json
 create mode 100644 PAwChO_lab5/node_modules/nodemon/node_modules/ms/readme.md
 create mode 100644 PAwChO_lab5/node_modules/nodemon/package.json
 create mode 100644 PAwChO_lab5/node_modules/nopt/.npmignore
 create mode 100644 PAwChO_lab5/node_modules/nopt/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/nopt/README.md
 create mode 100644 PAwChO_lab5/node_modules/nopt/bin/nopt.js
 create mode 100644 PAwChO_lab5/node_modules/nopt/examples/my-program.js
 create mode 100644 PAwChO_lab5/node_modules/nopt/lib/nopt.js
 create mode 100644 PAwChO_lab5/node_modules/nopt/package.json
 create mode 100644 PAwChO_lab5/node_modules/normalize-path/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/normalize-path/README.md
 create mode 100644 PAwChO_lab5/node_modules/normalize-path/index.js
 create mode 100644 PAwChO_lab5/node_modules/normalize-path/package.json
 create mode 100644 PAwChO_lab5/node_modules/object-inspect/.eslintrc
 create mode 100644 PAwChO_lab5/node_modules/object-inspect/.github/FUNDING.yml
 create mode 100644 PAwChO_lab5/node_modules/object-inspect/.nycrc
 create mode 100644 PAwChO_lab5/node_modules/object-inspect/CHANGELOG.md
 create mode 100644 PAwChO_lab5/node_modules/object-inspect/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/object-inspect/example/all.js
 create mode 100644 PAwChO_lab5/node_modules/object-inspect/example/circular.js
 create mode 100644 PAwChO_lab5/node_modules/object-inspect/example/fn.js
 create mode 100644 PAwChO_lab5/node_modules/object-inspect/example/inspect.js
 create mode 100644 PAwChO_lab5/node_modules/object-inspect/index.js
 create mode 100644 PAwChO_lab5/node_modules/object-inspect/package-support.json
 create mode 100644 PAwChO_lab5/node_modules/object-inspect/package.json
 create mode 100644 PAwChO_lab5/node_modules/object-inspect/readme.markdown
 create mode 100644 PAwChO_lab5/node_modules/object-inspect/test-core-js.js
 create mode 100644 PAwChO_lab5/node_modules/object-inspect/test/bigint.js
 create mode 100644 PAwChO_lab5/node_modules/object-inspect/test/browser/dom.js
 create mode 100644 PAwChO_lab5/node_modules/object-inspect/test/circular.js
 create mode 100644 PAwChO_lab5/node_modules/object-inspect/test/deep.js
 create mode 100644 PAwChO_lab5/node_modules/object-inspect/test/element.js
 create mode 100644 PAwChO_lab5/node_modules/object-inspect/test/err.js
 create mode 100644 PAwChO_lab5/node_modules/object-inspect/test/fakes.js
 create mode 100644 PAwChO_lab5/node_modules/object-inspect/test/fn.js
 create mode 100644 PAwChO_lab5/node_modules/object-inspect/test/global.js
 create mode 100644 PAwChO_lab5/node_modules/object-inspect/test/has.js
 create mode 100644 PAwChO_lab5/node_modules/object-inspect/test/holes.js
 create mode 100644 PAwChO_lab5/node_modules/object-inspect/test/indent-option.js
 create mode 100644 PAwChO_lab5/node_modules/object-inspect/test/inspect.js
 create mode 100644 PAwChO_lab5/node_modules/object-inspect/test/lowbyte.js
 create mode 100644 PAwChO_lab5/node_modules/object-inspect/test/number.js
 create mode 100644 PAwChO_lab5/node_modules/object-inspect/test/quoteStyle.js
 create mode 100644 PAwChO_lab5/node_modules/object-inspect/test/toStringTag.js
 create mode 100644 PAwChO_lab5/node_modules/object-inspect/test/undef.js
 create mode 100644 PAwChO_lab5/node_modules/object-inspect/test/values.js
 create mode 100644 PAwChO_lab5/node_modules/object-inspect/util.inspect.js
 create mode 100644 PAwChO_lab5/node_modules/on-finished/HISTORY.md
 create mode 100644 PAwChO_lab5/node_modules/on-finished/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/on-finished/README.md
 create mode 100644 PAwChO_lab5/node_modules/on-finished/index.js
 create mode 100644 PAwChO_lab5/node_modules/on-finished/package.json
 create mode 100644 PAwChO_lab5/node_modules/parseurl/HISTORY.md
 create mode 100644 PAwChO_lab5/node_modules/parseurl/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/parseurl/README.md
 create mode 100644 PAwChO_lab5/node_modules/parseurl/index.js
 create mode 100644 PAwChO_lab5/node_modules/parseurl/package.json
 create mode 100644 PAwChO_lab5/node_modules/path-to-regexp/History.md
 create mode 100644 PAwChO_lab5/node_modules/path-to-regexp/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/path-to-regexp/Readme.md
 create mode 100644 PAwChO_lab5/node_modules/path-to-regexp/index.js
 create mode 100644 PAwChO_lab5/node_modules/path-to-regexp/package.json
 create mode 100644 PAwChO_lab5/node_modules/picomatch/CHANGELOG.md
 create mode 100644 PAwChO_lab5/node_modules/picomatch/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/picomatch/README.md
 create mode 100644 PAwChO_lab5/node_modules/picomatch/index.js
 create mode 100644 PAwChO_lab5/node_modules/picomatch/lib/constants.js
 create mode 100644 PAwChO_lab5/node_modules/picomatch/lib/parse.js
 create mode 100644 PAwChO_lab5/node_modules/picomatch/lib/picomatch.js
 create mode 100644 PAwChO_lab5/node_modules/picomatch/lib/scan.js
 create mode 100644 PAwChO_lab5/node_modules/picomatch/lib/utils.js
 create mode 100644 PAwChO_lab5/node_modules/picomatch/package.json
 create mode 100644 PAwChO_lab5/node_modules/proxy-addr/HISTORY.md
 create mode 100644 PAwChO_lab5/node_modules/proxy-addr/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/proxy-addr/README.md
 create mode 100644 PAwChO_lab5/node_modules/proxy-addr/index.js
 create mode 100644 PAwChO_lab5/node_modules/proxy-addr/package.json
 create mode 100644 PAwChO_lab5/node_modules/pstree.remy/.travis.yml
 create mode 100644 PAwChO_lab5/node_modules/pstree.remy/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/pstree.remy/README.md
 create mode 100644 PAwChO_lab5/node_modules/pstree.remy/lib/index.js
 create mode 100644 PAwChO_lab5/node_modules/pstree.remy/lib/tree.js
 create mode 100644 PAwChO_lab5/node_modules/pstree.remy/lib/utils.js
 create mode 100644 PAwChO_lab5/node_modules/pstree.remy/package.json
 create mode 100644 PAwChO_lab5/node_modules/pstree.remy/tests/fixtures/index.js
 create mode 100644 PAwChO_lab5/node_modules/pstree.remy/tests/fixtures/out1
 create mode 100644 PAwChO_lab5/node_modules/pstree.remy/tests/fixtures/out2
 create mode 100644 PAwChO_lab5/node_modules/pstree.remy/tests/index.test.js
 create mode 100644 PAwChO_lab5/node_modules/qs/.editorconfig
 create mode 100644 PAwChO_lab5/node_modules/qs/.eslintrc
 create mode 100644 PAwChO_lab5/node_modules/qs/.github/FUNDING.yml
 create mode 100644 PAwChO_lab5/node_modules/qs/.nycrc
 create mode 100644 PAwChO_lab5/node_modules/qs/CHANGELOG.md
 create mode 100644 PAwChO_lab5/node_modules/qs/LICENSE.md
 create mode 100644 PAwChO_lab5/node_modules/qs/README.md
 create mode 100644 PAwChO_lab5/node_modules/qs/dist/qs.js
 create mode 100644 PAwChO_lab5/node_modules/qs/lib/formats.js
 create mode 100644 PAwChO_lab5/node_modules/qs/lib/index.js
 create mode 100644 PAwChO_lab5/node_modules/qs/lib/parse.js
 create mode 100644 PAwChO_lab5/node_modules/qs/lib/stringify.js
 create mode 100644 PAwChO_lab5/node_modules/qs/lib/utils.js
 create mode 100644 PAwChO_lab5/node_modules/qs/package.json
 create mode 100644 PAwChO_lab5/node_modules/qs/test/parse.js
 create mode 100644 PAwChO_lab5/node_modules/qs/test/stringify.js
 create mode 100644 PAwChO_lab5/node_modules/qs/test/utils.js
 create mode 100644 PAwChO_lab5/node_modules/range-parser/HISTORY.md
 create mode 100644 PAwChO_lab5/node_modules/range-parser/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/range-parser/README.md
 create mode 100644 PAwChO_lab5/node_modules/range-parser/index.js
 create mode 100644 PAwChO_lab5/node_modules/range-parser/package.json
 create mode 100644 PAwChO_lab5/node_modules/raw-body/HISTORY.md
 create mode 100644 PAwChO_lab5/node_modules/raw-body/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/raw-body/README.md
 create mode 100644 PAwChO_lab5/node_modules/raw-body/SECURITY.md
 create mode 100644 PAwChO_lab5/node_modules/raw-body/index.d.ts
 create mode 100644 PAwChO_lab5/node_modules/raw-body/index.js
 create mode 100644 PAwChO_lab5/node_modules/raw-body/package.json
 create mode 100644 PAwChO_lab5/node_modules/readdirp/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/readdirp/README.md
 create mode 100644 PAwChO_lab5/node_modules/readdirp/index.d.ts
 create mode 100644 PAwChO_lab5/node_modules/readdirp/index.js
 create mode 100644 PAwChO_lab5/node_modules/readdirp/package.json
 create mode 100644 PAwChO_lab5/node_modules/safe-buffer/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/safe-buffer/README.md
 create mode 100644 PAwChO_lab5/node_modules/safe-buffer/index.d.ts
 create mode 100644 PAwChO_lab5/node_modules/safe-buffer/index.js
 create mode 100644 PAwChO_lab5/node_modules/safe-buffer/package.json
 create mode 100644 PAwChO_lab5/node_modules/safer-buffer/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/safer-buffer/Porting-Buffer.md
 create mode 100644 PAwChO_lab5/node_modules/safer-buffer/Readme.md
 create mode 100644 PAwChO_lab5/node_modules/safer-buffer/dangerous.js
 create mode 100644 PAwChO_lab5/node_modules/safer-buffer/package.json
 create mode 100644 PAwChO_lab5/node_modules/safer-buffer/safer.js
 create mode 100644 PAwChO_lab5/node_modules/safer-buffer/tests.js
 create mode 100644 PAwChO_lab5/node_modules/semver/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/semver/README.md
 create mode 100644 PAwChO_lab5/node_modules/semver/bin/semver.js
 create mode 100644 PAwChO_lab5/node_modules/semver/classes/comparator.js
 create mode 100644 PAwChO_lab5/node_modules/semver/classes/index.js
 create mode 100644 PAwChO_lab5/node_modules/semver/classes/range.js
 create mode 100644 PAwChO_lab5/node_modules/semver/classes/semver.js
 create mode 100644 PAwChO_lab5/node_modules/semver/functions/clean.js
 create mode 100644 PAwChO_lab5/node_modules/semver/functions/cmp.js
 create mode 100644 PAwChO_lab5/node_modules/semver/functions/coerce.js
 create mode 100644 PAwChO_lab5/node_modules/semver/functions/compare-build.js
 create mode 100644 PAwChO_lab5/node_modules/semver/functions/compare-loose.js
 create mode 100644 PAwChO_lab5/node_modules/semver/functions/compare.js
 create mode 100644 PAwChO_lab5/node_modules/semver/functions/diff.js
 create mode 100644 PAwChO_lab5/node_modules/semver/functions/eq.js
 create mode 100644 PAwChO_lab5/node_modules/semver/functions/gt.js
 create mode 100644 PAwChO_lab5/node_modules/semver/functions/gte.js
 create mode 100644 PAwChO_lab5/node_modules/semver/functions/inc.js
 create mode 100644 PAwChO_lab5/node_modules/semver/functions/lt.js
 create mode 100644 PAwChO_lab5/node_modules/semver/functions/lte.js
 create mode 100644 PAwChO_lab5/node_modules/semver/functions/major.js
 create mode 100644 PAwChO_lab5/node_modules/semver/functions/minor.js
 create mode 100644 PAwChO_lab5/node_modules/semver/functions/neq.js
 create mode 100644 PAwChO_lab5/node_modules/semver/functions/parse.js
 create mode 100644 PAwChO_lab5/node_modules/semver/functions/patch.js
 create mode 100644 PAwChO_lab5/node_modules/semver/functions/prerelease.js
 create mode 100644 PAwChO_lab5/node_modules/semver/functions/rcompare.js
 create mode 100644 PAwChO_lab5/node_modules/semver/functions/rsort.js
 create mode 100644 PAwChO_lab5/node_modules/semver/functions/satisfies.js
 create mode 100644 PAwChO_lab5/node_modules/semver/functions/sort.js
 create mode 100644 PAwChO_lab5/node_modules/semver/functions/valid.js
 create mode 100644 PAwChO_lab5/node_modules/semver/index.js
 create mode 100644 PAwChO_lab5/node_modules/semver/internal/constants.js
 create mode 100644 PAwChO_lab5/node_modules/semver/internal/debug.js
 create mode 100644 PAwChO_lab5/node_modules/semver/internal/identifiers.js
 create mode 100644 PAwChO_lab5/node_modules/semver/internal/parse-options.js
 create mode 100644 PAwChO_lab5/node_modules/semver/internal/re.js
 create mode 100644 PAwChO_lab5/node_modules/semver/package.json
 create mode 100644 PAwChO_lab5/node_modules/semver/preload.js
 create mode 100644 PAwChO_lab5/node_modules/semver/range.bnf
 create mode 100644 PAwChO_lab5/node_modules/semver/ranges/gtr.js
 create mode 100644 PAwChO_lab5/node_modules/semver/ranges/intersects.js
 create mode 100644 PAwChO_lab5/node_modules/semver/ranges/ltr.js
 create mode 100644 PAwChO_lab5/node_modules/semver/ranges/max-satisfying.js
 create mode 100644 PAwChO_lab5/node_modules/semver/ranges/min-satisfying.js
 create mode 100644 PAwChO_lab5/node_modules/semver/ranges/min-version.js
 create mode 100644 PAwChO_lab5/node_modules/semver/ranges/outside.js
 create mode 100644 PAwChO_lab5/node_modules/semver/ranges/simplify.js
 create mode 100644 PAwChO_lab5/node_modules/semver/ranges/subset.js
 create mode 100644 PAwChO_lab5/node_modules/semver/ranges/to-comparators.js
 create mode 100644 PAwChO_lab5/node_modules/semver/ranges/valid.js
 create mode 100644 PAwChO_lab5/node_modules/send/HISTORY.md
 create mode 100644 PAwChO_lab5/node_modules/send/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/send/README.md
 create mode 100644 PAwChO_lab5/node_modules/send/SECURITY.md
 create mode 100644 PAwChO_lab5/node_modules/send/index.js
 create mode 100644 PAwChO_lab5/node_modules/send/node_modules/ms/index.js
 create mode 100644 PAwChO_lab5/node_modules/send/node_modules/ms/license.md
 create mode 100644 PAwChO_lab5/node_modules/send/node_modules/ms/package.json
 create mode 100644 PAwChO_lab5/node_modules/send/node_modules/ms/readme.md
 create mode 100644 PAwChO_lab5/node_modules/send/package.json
 create mode 100644 PAwChO_lab5/node_modules/serve-static/HISTORY.md
 create mode 100644 PAwChO_lab5/node_modules/serve-static/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/serve-static/README.md
 create mode 100644 PAwChO_lab5/node_modules/serve-static/index.js
 create mode 100644 PAwChO_lab5/node_modules/serve-static/package.json
 create mode 100644 PAwChO_lab5/node_modules/set-function-length/.eslintrc
 create mode 100644 PAwChO_lab5/node_modules/set-function-length/.github/FUNDING.yml
 create mode 100644 PAwChO_lab5/node_modules/set-function-length/.nycrc
 create mode 100644 PAwChO_lab5/node_modules/set-function-length/CHANGELOG.md
 create mode 100644 PAwChO_lab5/node_modules/set-function-length/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/set-function-length/README.md
 create mode 100644 PAwChO_lab5/node_modules/set-function-length/env.d.ts
 create mode 100644 PAwChO_lab5/node_modules/set-function-length/env.js
 create mode 100644 PAwChO_lab5/node_modules/set-function-length/index.d.ts
 create mode 100644 PAwChO_lab5/node_modules/set-function-length/index.js
 create mode 100644 PAwChO_lab5/node_modules/set-function-length/package.json
 create mode 100644 PAwChO_lab5/node_modules/set-function-length/tsconfig.json
 create mode 100644 PAwChO_lab5/node_modules/setprototypeof/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/setprototypeof/README.md
 create mode 100644 PAwChO_lab5/node_modules/setprototypeof/index.d.ts
 create mode 100644 PAwChO_lab5/node_modules/setprototypeof/index.js
 create mode 100644 PAwChO_lab5/node_modules/setprototypeof/package.json
 create mode 100644 PAwChO_lab5/node_modules/setprototypeof/test/index.js
 create mode 100644 PAwChO_lab5/node_modules/side-channel/.editorconfig
 create mode 100644 PAwChO_lab5/node_modules/side-channel/.eslintrc
 create mode 100644 PAwChO_lab5/node_modules/side-channel/.github/FUNDING.yml
 create mode 100644 PAwChO_lab5/node_modules/side-channel/.nycrc
 create mode 100644 PAwChO_lab5/node_modules/side-channel/CHANGELOG.md
 create mode 100644 PAwChO_lab5/node_modules/side-channel/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/side-channel/README.md
 create mode 100644 PAwChO_lab5/node_modules/side-channel/index.d.ts
 create mode 100644 PAwChO_lab5/node_modules/side-channel/index.js
 create mode 100644 PAwChO_lab5/node_modules/side-channel/package.json
 create mode 100644 PAwChO_lab5/node_modules/side-channel/test/index.js
 create mode 100644 PAwChO_lab5/node_modules/side-channel/tsconfig.json
 create mode 100644 PAwChO_lab5/node_modules/simple-update-notifier/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/simple-update-notifier/README.md
 create mode 100644 PAwChO_lab5/node_modules/simple-update-notifier/build/index.d.ts
 create mode 100644 PAwChO_lab5/node_modules/simple-update-notifier/build/index.js
 create mode 100644 PAwChO_lab5/node_modules/simple-update-notifier/package.json
 create mode 100644 PAwChO_lab5/node_modules/simple-update-notifier/src/borderedText.ts
 create mode 100644 PAwChO_lab5/node_modules/simple-update-notifier/src/cache.spec.ts
 create mode 100644 PAwChO_lab5/node_modules/simple-update-notifier/src/cache.ts
 create mode 100644 PAwChO_lab5/node_modules/simple-update-notifier/src/getDistVersion.spec.ts
 create mode 100644 PAwChO_lab5/node_modules/simple-update-notifier/src/getDistVersion.ts
 create mode 100644 PAwChO_lab5/node_modules/simple-update-notifier/src/hasNewVersion.spec.ts
 create mode 100644 PAwChO_lab5/node_modules/simple-update-notifier/src/hasNewVersion.ts
 create mode 100644 PAwChO_lab5/node_modules/simple-update-notifier/src/index.spec.ts
 create mode 100644 PAwChO_lab5/node_modules/simple-update-notifier/src/index.ts
 create mode 100644 PAwChO_lab5/node_modules/simple-update-notifier/src/isNpmOrYarn.ts
 create mode 100644 PAwChO_lab5/node_modules/simple-update-notifier/src/types.ts
 create mode 100644 PAwChO_lab5/node_modules/statuses/HISTORY.md
 create mode 100644 PAwChO_lab5/node_modules/statuses/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/statuses/README.md
 create mode 100644 PAwChO_lab5/node_modules/statuses/codes.json
 create mode 100644 PAwChO_lab5/node_modules/statuses/index.js
 create mode 100644 PAwChO_lab5/node_modules/statuses/package.json
 create mode 100644 PAwChO_lab5/node_modules/supports-color/browser.js
 create mode 100644 PAwChO_lab5/node_modules/supports-color/index.js
 create mode 100644 PAwChO_lab5/node_modules/supports-color/license
 create mode 100644 PAwChO_lab5/node_modules/supports-color/package.json
 create mode 100644 PAwChO_lab5/node_modules/supports-color/readme.md
 create mode 100644 PAwChO_lab5/node_modules/to-regex-range/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/to-regex-range/README.md
 create mode 100644 PAwChO_lab5/node_modules/to-regex-range/index.js
 create mode 100644 PAwChO_lab5/node_modules/to-regex-range/package.json
 create mode 100644 PAwChO_lab5/node_modules/toidentifier/HISTORY.md
 create mode 100644 PAwChO_lab5/node_modules/toidentifier/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/toidentifier/README.md
 create mode 100644 PAwChO_lab5/node_modules/toidentifier/index.js
 create mode 100644 PAwChO_lab5/node_modules/toidentifier/package.json
 create mode 100644 PAwChO_lab5/node_modules/touch/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/touch/README.md
 create mode 100644 PAwChO_lab5/node_modules/touch/bin/nodetouch.js
 create mode 100644 PAwChO_lab5/node_modules/touch/index.js
 create mode 100644 PAwChO_lab5/node_modules/touch/package.json
 create mode 100644 PAwChO_lab5/node_modules/type-is/HISTORY.md
 create mode 100644 PAwChO_lab5/node_modules/type-is/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/type-is/README.md
 create mode 100644 PAwChO_lab5/node_modules/type-is/index.js
 create mode 100644 PAwChO_lab5/node_modules/type-is/package.json
 create mode 100644 PAwChO_lab5/node_modules/undefsafe/.github/workflows/release.yml
 create mode 100644 PAwChO_lab5/node_modules/undefsafe/.jscsrc
 create mode 100644 PAwChO_lab5/node_modules/undefsafe/.jshintrc
 create mode 100644 PAwChO_lab5/node_modules/undefsafe/.travis.yml
 create mode 100644 PAwChO_lab5/node_modules/undefsafe/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/undefsafe/README.md
 create mode 100644 PAwChO_lab5/node_modules/undefsafe/example.js
 create mode 100644 PAwChO_lab5/node_modules/undefsafe/lib/undefsafe.js
 create mode 100644 PAwChO_lab5/node_modules/undefsafe/package.json
 create mode 100644 PAwChO_lab5/node_modules/unpipe/HISTORY.md
 create mode 100644 PAwChO_lab5/node_modules/unpipe/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/unpipe/README.md
 create mode 100644 PAwChO_lab5/node_modules/unpipe/index.js
 create mode 100644 PAwChO_lab5/node_modules/unpipe/package.json
 create mode 100644 PAwChO_lab5/node_modules/utils-merge/.npmignore
 create mode 100644 PAwChO_lab5/node_modules/utils-merge/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/utils-merge/README.md
 create mode 100644 PAwChO_lab5/node_modules/utils-merge/index.js
 create mode 100644 PAwChO_lab5/node_modules/utils-merge/package.json
 create mode 100644 PAwChO_lab5/node_modules/vary/HISTORY.md
 create mode 100644 PAwChO_lab5/node_modules/vary/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/vary/README.md
 create mode 100644 PAwChO_lab5/node_modules/vary/index.js
 create mode 100644 PAwChO_lab5/node_modules/vary/package.json
 create mode 100644 PAwChO_lab5/node_modules/yallist/LICENSE
 create mode 100644 PAwChO_lab5/node_modules/yallist/README.md
 create mode 100644 PAwChO_lab5/node_modules/yallist/iterator.js
 create mode 100644 PAwChO_lab5/node_modules/yallist/package.json
 create mode 100644 PAwChO_lab5/node_modules/yallist/yallist.js
 create mode 100644 PAwChO_lab5/package-lock.json
 create mode 100644 PAwChO_lab5/package.json

--------------------------------------------------------------------------------
//Pushowanie zmian do zdalnego repozytorium
C:\Users\anastasiia\pawcho6\PAwChO_lab5>git push origin main
Enumerating objects: 967, done.
Counting objects: 100% (967/967), done.
Delta compression using up to 12 threads
Compressing objects: 100% (914/914), done.
Writing objects: 100% (966/966), 983.72 KiB | 1.01 MiB/s, done.
Total 966 (delta 153), reused 0 (delta 0), pack-reused 0
remote: Resolving deltas: 100% (153/153), done.
To https://github.com/nastkap/pawcho6.git
   f86979e..c6c615e  main -> main

--------------------------------------------------------------------------------
//Uruchamianie kontenera Docker z buildkit
PS C:\Users\anastasiia\pawcho6\PAwChO_lab5> docker run --rm --privileged -d --name buildkit moby/buildkit
Unable to find image 'moby/buildkit:latest' locally
latest: Pulling from moby/buildkit
4abcf2066143: Already exists
77e3817cafb0: Pull complete
fabeb51fadd9: Pull complete
1479f6e1da81: Pull complete
Digest: sha256:9194b5ec1be368f41c516df7f93f7f540630ea06136056b2ffebb62226ed4ad6
Status: Downloaded newer image for moby/buildkit:latest
28d9380d210dd46940271ca266f164ad53b24c7a7ae574dbcfc2ff3256e92f7b
PS C:\Users\anastasiia\pawcho6\PAwChO_lab5>

---------------------------------------------------------------------------------
//Sprawdzenie działających kontenerów Docker
PS C:\Users\anastasiia\pawcho6\PAwChO_lab5> docker ps --filter name=buildkit
CONTAINER ID   IMAGE           COMMAND       CREATED          STATUS          PORTS     NAMES
28d9380d210d   moby/buildkit   "buildkitd"   43 seconds ago   Up 42 seconds             buildkit

---------------------------------------------------------------------------------
//Ustawianie zmiennej środowiskowej
anastasiia@DESKTOP-3HKTLS0 MINGW64 ~
$ export LAB=blablabla

---------------------------------------------------------------------------------
//Logowanie do rejestracji Docker
anastasiia@DESKTOP-3HKTLS0 MINGW64 ~
$ echo $LAB | docker login ghcr.io -u nastkap --password-stdin
Login Succeeded

---------------------------------------------------------------------------------
//Budowanie obrazu Docker

anastasiia@DESKTOP-3HKTLS0 MINGW64 ~
$ cd pawcho6

anastasiia@DESKTOP-3HKTLS0 MINGW64 ~/pawcho6 (main)
$ cd PAwChO_lab5

anastasiia@DESKTOP-3HKTLS0 MINGW64 ~/pawcho6/PAwChO_lab5 (main)
$ docker build -t ghcr.io/nastkap/pawcho-spr:lab6 -f Dockerfile .
#0 building with "default" instance using docker driver

#1 [internal] load build definition from Dockerfile
#1 transferring dockerfile: 1.38kB done
#1 DONE 0.0s

#2 resolve image config for docker.io/docker/dockerfile:1
#2 ...

#3 [auth] docker/dockerfile:pull token for registry-1.docker.io
#3 DONE 0.0s

#2 resolve image config for docker.io/docker/dockerfile:1
#2 DONE 1.9s

#4 docker-image://docker.io/docker/dockerfile:1@sha256:a57df69d0ea827fb7266491f2813635de6f17269be881f696fbfdf2d83dda33e
#4 CACHED

#5 [internal] load metadata for docker.io/library/nginx:latest
#5 ...

#6 [auth] library/node:pull token for registry-1.docker.io
#6 DONE 0.0s

#7 [auth] library/nginx:pull token for registry-1.docker.io
#7 DONE 0.0s

#8 [internal] load metadata for docker.io/library/node:alpine
#8 DONE 1.3s

#5 [internal] load metadata for docker.io/library/nginx:latest
#5 DONE 1.4s

#9 [internal] load .dockerignore
#9 transferring context: 2B done
#9 DONE 0.0s

#10 [builder 1/5] FROM docker.io/library/node:alpine@sha256:916b42f9e83466eb17d60a441a96f5cd57033bbfee6a80eae8e3249f34cf8dbe
#10 DONE 0.0s

#11 [stage-1 1/8] FROM docker.io/library/nginx:latest@sha256:ed6d2c43c8fbcd3eaa44c9dab6d94cb346234476230dc1681227aa72d07181ee
#11 DONE 0.0s

#12 [internal] load build context
#12 transferring context: 96B done
#12 DONE 0.0s

#13 [builder 2/5] WORKDIR /usr/app
#13 CACHED

#14 [stage-1 7/8] RUN apt-get update && apt-get install -y git
#14 CACHED

#15 [builder 3/5] COPY ./package.json ./
#15 CACHED

#16 [stage-1 5/8] COPY gh_cli_w_ed25519 /root/.ssh
#16 CACHED

#17 [stage-1 2/8] COPY --from=builder /usr/app/ /usr/share/nginx/html/
#17 CACHED

#18 [stage-1 4/8] RUN apt-get update &&     apt-get install -y --no-install-recommends openssh-client &&     rm -rf /var/lib/apt/lists/*
#18 CACHED

#19 [stage-1 6/8] RUN chmod 600 /root/.ssh
#19 CACHED

#20 [builder 5/5] COPY ./kod.js ./
#20 CACHED

#21 [stage-1 3/8] RUN ln -sf /usr/share/nginx/html/kod.js /usr/share/nginx/html/index.html
#21 CACHED

#22 [builder 4/5] RUN npm install
#22 CACHED

#23 [stage-1 8/8] RUN git clone https://github.com/nastkap/pawcho6.git /app
#23 CACHED

#24 exporting to image
#24 exporting layers done
#24 writing image sha256:9e6dfb4b7882eb53be6e27373f5a2b440c4ef8a0e594a0be5d0d4fb58b584a87 done
#24 naming to ghcr.io/nastkap/pawcho-spr:lab6 done
#24 DONE 0.0s

View build details: docker-desktop://dashboard/build/default/default/a73rxz1zihow2qgy54iuas33h

What's Next?
  View a summary of image vulnerabilities and recommendations → docker scout quickview
-------------------------------------------------------------------------------------------------------------------
//Wysyłania obrazu do repozytorium
anastasiia@DESKTOP-3HKTLS0 MINGW64 ~/pawcho6/PAwChO_lab5 (main)
$ docker push ghcr.io/nastkap/pawcho-spr:lab6
The push refers to repository [ghcr.io/nastkap/pawcho-spr]
ac398b27d60b: Preparing
94bf025abb42: Preparing
fa03547da701: Preparing
cc4641692b32: Preparing
b61095dfd9a0: Preparing
9d911a45442d: Preparing
09e880257db6: Preparing
9fd54926bcae: Preparing
175aa66db4cc: Preparing
e6380a7057a5: Preparing
1db2242fc1fa: Preparing
b09347a1aec6: Preparing
bbde741e108b: Preparing
52ec5a4316fa: Preparing
9d911a45442d: Waiting
09e880257db6: Waiting
9fd54926bcae: Waiting
175aa66db4cc: Waiting
e6380a7057a5: Waiting
1db2242fc1fa: Waiting
b09347a1aec6: Waiting
bbde741e108b: Waiting
52ec5a4316fa: Waiting
fa03547da701: Pushed
cc4641692b32: Pushed
9d911a45442d: Mounted from nastkap/lab6
ac398b27d60b: Pushed
09e880257db6: Mounted from nastkap/lab6
b61095dfd9a0: Pushed
175aa66db4cc: Mounted from nastkap/lab6
9fd54926bcae: Mounted from nastkap/lab6
e6380a7057a5: Mounted from nastkap/lab6
1db2242fc1fa: Mounted from nastkap/lab6
bbde741e108b: Mounted from nastkap/lab6
b09347a1aec6: Mounted from nastkap/lab6
52ec5a4316fa: Mounted from nastkap/lab6
94bf025abb42: Pushed
lab6: digest: sha256:7bdcd45a4723b83ae5b2a0e0e574dcf080d769789cd5345c8c477bafc14a0ac3 size: 3243

-------------------------------------------------------------------------------------------------------------------
//Pobieranie obrazu Docker:
PS C:\Users\anastasiia> docker pull ghcr.io/nastkap/pawcho-spr:lab6
lab6: Pulling from nastkap/pawcho-spr
Digest: blablabla
Status: Image is up to date for ghcr.io/nastkap/pawcho-spr:lab6
ghcr.io/nastkap/pawcho-spr:lab6

What's Next?
  View a summary of image vulnerabilities and recommendations → docker scout quickview ghcr.io/nastkap/pawcho-spr:lab6




