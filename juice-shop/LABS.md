# OWASP Juice Shop Labs

This section contains an expanded, systematic, and comprehensive set of labs for OWASP Juice Shop. All labs are designed to be executed inside a single Kali Linux VM with Juice Shop running locally at `http://localhost:3000`

---

## Lab 1: Reconnaissance and Application Mapping

**Objective:** Understand the structure of Juice Shop and discover hidden functionality.

### Steps

1. Start Juice Shop:

   ```bash
   npm start
   ```
2. Open the site:

   ```
   http://localhost:3000
   ```
3. Analyze page structure using:

   * Browser Developer Tools
   * Burp Suite Target -> Site Map
   * ZAP Spider / AJAX Spider

### Expected Findings

* `/rest/products`
* `/api/Feedbacks/`
* `/ftp/`
* `/profile`
* `/login`
* `/#/register`

---

## Lab 2: SQL Injection — Login Bypass

**Objective:** Perform SQLi to bypass authentication.

### Steps

1. Open the login page: `/login`.
2. Enter a known SQLi payload:

   ```
   ' OR 1=1--
   ```
3. For the password, enter any value.
4. Submit.

### Expected Outcome

* Authentication bypass using tautology.

---

## Lab 3: Union-Based SQL Injection on Product Search

**Objective:** Extract data via SQL injection in the search bar.

### Steps

1. Navigate to the search field.
2. Enter a test payload:

   ```
   '
   ```
3. Enter UNION payloads:

   ```
   ' UNION SELECT null,'test',null,null--
   ```
4. Iterate to discover valid column counts.

### Expected Outcome

* Error-based responses
* Successful UNION injection output in product listing

---

## Lab 4: Cross-Site Scripting (Stored XSS)

**Objective:** Inject persistent scripts via the feedback form.

### Steps

1. Go to `/#/contact`.
2. Submit the following payloads in the comment field:

   ```html
   <script>alert('XSS')</script>
   ```
3. Submit the form.
4. View Admin section (if possible) or inspect stored entries.

### Expected Outcome

* Stored XSS execution in other views.

---

## Lab 5: DOM-Based XSS — Search Field

**Objective:** Perform DOM XSS via client-side reflection.

### Steps

1. Open URL:

   ```
   http://localhost:3000/#/search?q=test
   ```
2. Modify `q=` parameter:

   ```
   http://localhost:3000/#/search?q=<script>alert(1)</script>
   ```

### Expected Outcome

* JavaScript execution due to unsafe client-side rendering.

---

## Lab 6: Broken Access Control — Access Admin Page

**Objective:** Access restricted admin functionality.

### Steps

1. Try direct access:

   ```
   http://localhost:3000/#/administration
   ```
2. Use Burp Intruder to brute-force hidden roles.
3. Modify JWT in localStorage:

   * Extract token
   * Decode at jwt.io
   * Change role to `admin`
   * Re-sign using algorithm `none` if applicable

### Expected Outcome

* Unauthorized access to admin pages.

---

## Lab 7: Directory Listing Enumeration

**Objective:** Enumerate files in `/ftp`.

### Steps

1. Navigate to:

   ```
   http://localhost:3000/ftp
   ```
2. Download files.
3. Analyze their metadata.

### Expected Outcome

* Sensitive files exposed in public directory.

---

## Lab 8: Broken Authentication — Password Reset Flaws

**Objective:** Abuse weak password reset flows.

### Steps

1. Navigate to Forgot Password.
2. Intercept request via Burp.
3. Modify email parameter.
4. Check for predictable tokens.

### Expected Outcome

* Ability to reset another user's password.

---

## Lab 9: CSRF — Change User Data Without Consent

**Objective:** Execute a CSRF attack on user profile updates.

### Steps

1. Intercept profile update request.
2. Create malicious HTML form:

   ```html
   <form action="http://localhost:3000/api/Users/1" method="POST">
     <input type="hidden" name="email" value="attacker@example.com">
   </form>
   ```
3. Host file using Python:

   ```bash
   python3 -m http.server 8080
   ```
4. Visit malicious page while logged in.

### Expected Outcome

* Profile information changes without user interaction.

---

## Lab 10: Business Logic Abuse — Manipulating Product Quantities

**Objective:** Exploit weak validation to order negative quantities.

### Steps

1. Add product to cart.
2. Intercept cart update request.
3. Modify quantity to a negative number:

   ```json
   {
     "quantity": -10
   }
   ```

### Expected Outcome

* Price manipulation or credits granted to attacker.

---

## Lab 11: Insecure API Exposure — Enumerating User IDs

**Objective:** Identify user enumeration vulnerabilities.

### Steps

1. Request:

   ```
   GET /api/Users/1
   ```
2. Use Intruder to increment IDs.

### Expected Outcome

* Exposure of full user list.

---

## Lab 12: JWT Cracking and Algorithm Abuse

**Objective:** Abuse weak or misconfigured JWT signing.

### Steps

1. Capture JWT.
2. Check algorithm used.
3. Modify to `none`.
4. Inject elevated privileges.

### Expected Outcome

* Privilege escalation.

---

## Lab 13: NoSQL Injection

**Objective:** Inject into MongoDB filters.

### Steps

1. Test login with JSON-style payload:

   ```
   {
     "email": {"$ne": null},
     "password": {"$ne": null}
   }
   ```

### Expected Outcome

* Authentication bypass.

---

## Lab 14: File Upload Vulnerability

**Objective:** Upload malicious files.

### Steps

1. Navigate to upload feature.
2. Attempt:

   * SVG with embedded JavaScript
   * File renamed to `.png` but actual `.js`
3. Intercept and modify content-type.

### Expected Outcome

* Upload acceptance of dangerous files.

---

## Lab 15: SSRF — Request Internal Services

**Objective:** Abuse URL fetch functionality.

### Steps

1. Identify endpoint accepting URLs.
2. Submit internal address:

   ```
   http://localhost:3000/ftp
   ```
3. Attempt access to:

   ```
   http://127.0.0.1:3000/admin
   ```

### Expected Outcome

* Internal resource disclosure.
