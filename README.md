beego-security-headers
======================

_beego-security-headers_ is a [beego framework][beegof] filter which allows
[HTTP response security headers][owaspsh] to be easily managed on application's
configuration file.

After adding _beego-security-headers_ to your application, you can test it at
[securityheaders.com][sechcom].

## How to use

1. Download **beego-security-headers** package
    ```bash
    go get github.com/gosecguy/beego-security-headers
    ```
2. Import the package on your application's `main.go`
    ```go
    import securityHeaders "github.com/gosecguy/beego-security-headers"
    ```
3. add the following line to your application `main` function
    ```go
    securityHeaders.Init()
    ```
4. edit your `conf/app.conf` file with the desired security headers
    ```
    [secheaders]
    x-xss-protection = "1; mode=block"
    x-frame-options = "DENY"
    x-content-type-options = "nosniff"
    strict-transport-security = "max-age=315360000"
    referrer-policy = "same-origin"
    ```

## Example

To run beego ToDo application with _beego-security-headers_, run

```
$ docker build -t beego-security-headers:example .
```

followed by

```
$ docker run -it --rm -p 8080:8080 beego-security-headers:example
```

Then visit http://localhost:8080 and open Developer Tools.
Switch to the Network tab and select the first `GET` request to inspect HTTP
request headers

![Network panel][screenshot]

## License

Copyright (c) 2018

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

[beegof]: https://beego.me/
[owaspsh]: https://www.owasp.org/index.php/OWASP_Secure_Headers_Project#tab=Headers
[sechcom]: https://securityheaders.com/
[screenshot]: screenshot.png

