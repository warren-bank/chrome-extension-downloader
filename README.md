### [chrome-extension-downloader](https://github.com/warren-bank/chrome-extension-downloader)

#### Summary:

Command-line shell script to download a CRX (chrome extension) for offline installation.

* available for both Windows _cmd_ and Linux _bash_ shell
* no installation
  * assumes that a `wget` binary can be found in _PATH_

#### Usage:

```bash
crxdl "ID" ["output-path"]
```

* "ID"
  * the unique ID of a chrome extension
* "output-path"
  * the optional filepath where the CRX is saved
  * can either be:
    * an absolute path
    * a filename that is saved in the working directory
  * default value:
    * saves file in the working directory
    * filename is: "$ID.crx"

#### Variations:

* configured to download format: CRX2
  ```bash
  crx2dl "ID" ["output-path"]
  ```
* configured to download format: CRX3 Manifest V2
  ```bash
  crx3m2dl "ID" ["output-path"]
  ```
* configured to download format: CRX3 Manifest V3
  ```bash
  crx3m3dl "ID" ["output-path"]
  ```

#### Example:

To download the CRX: "uBlock Origin"

* URL of extension:
  * https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm?hl=en
* ID of extension (obtained from its URL):
  * cjpalhdlnbpafiamejdnhcphjbkeiagm
* command to save extension using default output path:
  * `crxdl "cjpalhdlnbpafiamejdnhcphjbkeiagm"`
    * saved to &rArr; `./cjpalhdlnbpafiamejdnhcphjbkeiagm.crx`
* command to save extension to a non-default filename in the working directory:
  * `crxdl "cjpalhdlnbpafiamejdnhcphjbkeiagm" "uBlock.crx"`
    * saved to &rArr; `./uBlock.crx`
* command to save extension to a non-default filepath:
  * `crxdl "cjpalhdlnbpafiamejdnhcphjbkeiagm" "/save/to/path/uBlock.crx"`
    * saved to &rArr; `/save/to/path/uBlock.crx`

#### How to (offline) install a saved CRX:

* open the _Extensions_ page
  * from the address bar:
    * open: [chrome://extensions/](chrome://extensions/)
  * from the navigation menu:
    * click: the _Settings_ "hamburger" icon
    * select: "More tools" > "Extensions"
* drag &amp; drop the saved .crx file onto the _Extensions_ page
* follow the prompts:
  * click: "Add extension"

#### Credits:

* [Rob Wu](https://github.com/Rob--W)
  * [StackOverflow answer](https://stackoverflow.com/a/14099762)
    * explains how to directly download CRX from Google
  * [crxviewer](https://github.com/Rob--W/crxviewer/blob/master/src/cws_pattern.js)
    * [commit](https://github.com/Rob--W/crxviewer/commit/49a84243c9dadfd0401955a4c839bcc13ad53ce9) that adds platform-specific querystring parameters
* [Jiri Pospisil](https://github.com/jiripospisil)
  * [chrome-ext-downloader](https://github.com/jiripospisil/chrome-ext-downloader/blob/master/bin/ced)

#### Legal:

* copyright: [Warren Bank](https://github.com/warren-bank)
* license: [GPL-2.0](https://www.gnu.org/licenses/old-licenses/gpl-2.0.txt)
