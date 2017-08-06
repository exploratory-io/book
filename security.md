# Exploratory Security

We know your data is extremely important to you and your business, and we're very protective of it.

There are two types of the services and products Exploratory offers.

Exploratory Cloud

Exploratory Desktop


# Data Center Security

Exploratory Cloud is hosted at DigitalOcean's data center, which are audited and certified by various internationally-recognized compliance standards. Please see [DigitalOcean's policy page](https://www.digitalocean.com/help/policy/) for more details.


# System Security

System installation using hardened, patched OS
Dedicated firewall and VPN services to help block unauthorized system access
Distributed Denial of Service (DDoS) mitigation services powered by industry-leading solutions


# Software Security

We employ a team of 24/7/365 server specialists at Exploratory to keep our software and its dependencies up to date eliminating potential security vulnerabilities. We employ a wide range of monitoring solutions for preventing and eliminating attacks to the site.


# Security Engineering Practices

Exploratory’s engineering team is responsible for ensuring that security is a key component of the entire development process. From design reviews, to test cycles, to bug triage, security issues are closely tracked and monitored. All security issues are thoroughly researched, resolved, and then re-tested to ensure they are properly remediated. Additionally, we require key engineering team members to go through secure code development training. Training is delivered at regular intervals or as needed for new hires. This is done to ensure that coding and testing are done with security in mind.

# Security Monitoring,Testing and Validation

## In-House

Exploratory performs in-house vulnerability and web application scans as part of our standard product testing process for every release. Our dedicated security testing staff performs tests using a variety of automated and manual testing procedures. Test plans include test cases for common vulnerabilities as well
as top vulnerabilities published by the Open Web Application Security Project (OWASP). We also monitor the National Vulnerability Database for vulnerabilities that may affect third-party components included in our products.

## Third-Party

As part of every major release cycle, we put Exploratory Server (and related products and services) through an extensive third-party security testing and validation process. Working closely with a third party security partner, we endeavor to proactively identify and address security issues in our products.

The partner performs gray box testing of our products. This includes targeted source code reviews to  nd advanced application and web security vulnerabilities, including:

- Cross Site Reference Forgery (XSRF)
- Cross Site Scripting
- SQL Injection
- Session management subversion
- Forced Browsing
- Format Strings
- LDAP Injection
- Response Splitting
- Internationalization attacks
- Directory Traversal
- SSL Cipher Strength Analysis
- Cookie Analysis
- HTTP Method Analysis
- Authentication/Authorization Errors
- Hostile Link attacks

They also perform penetration testing of the application looking for flaws such as:

- SQL/XML/HTML injection
- Business logic flaws
- Session management flaws
- Improper cookie management/scoping
- Timing attacks
- Access control failures
- Other attacks that could compromise of user privacy or system integrity


# Customer Segregation

Exploratory Cloud is multi-tenant and does not segment your data from other users’ data. Your data may live on the same servers as another user’s data. We consider your data private and do not permit another user to access it unless you explicitly share it.

# Data Retention and Deletion

Exploratory Cloud retains your content unless you take explicit steps to delete data, charts, and notes. For information on how to delete them, please see this [help document](https://docs.exploratory.io/share/share.html). For information on our retention policies, please refer to the section of our [privacy policy](https://exploratory.io/privacy/), titled “Data Retention and Deletion”.

# Media Disposal and Destruction

We securely erase or destroy all storage media if it has ever been used to store user data. We follow NIST’s guidance in special publication 800-88 to accomplish this. For an example of how we securely destroy broken hard drives, please check out this blog article.
We utilize a variety of storage options in Google’s Cloud Platform (“GCP”), including local disks, persistent disks, and Google Cloud Storage buckets. We take advantage of Google’s cryptographic erasure processes to ensure that repurposing storage does not result in exposing private customer data.


# Communications

Communications

All communications with Exploratory are transmitted over SSL (HTTPS) for both access to the public website as well as the API. All pushing and pulling of private data is done over HTTPS using your Exploratory username and password.

The SSH login credentials used to push and pull can not be used to access a shell or the filesystem. All users are virtual and have no user account on our machines.

# File system and backups

Every piece of hardware we use has an identical copy ready and waiting for an immediate hot-swap in case of hardware or software failure. Every line of code we store is saved on a minimum of three different servers, including an off-site backup. We do not retroactively remove repositories from backups when deleted by the user, as we may need to restore the repository for the user if it was removed accidentally.

We do not encrypt repositories on disk because it would not be any more secure: the website and git back-end would need to decrypt the repositories on demand, slowing down response times. Any user with shell access to the file system would have access to the decryption routine, thus negating any security it provides. Therefore, we focus on making our machines and network as secure as possible.

# Employee access

No Exploratory employees ever access to your private data you import into Exploratory Desktop, Exploratory Collaboration Server, Scheduling Server, or Pro Server.  repositories unless required to for support reasons. Staff working directly in the file store access the compressed Git database, your code is never present as plaintext files like it would be in a local clone. Support staff may sign into your account to access settings related to your support issue. In rare cases staff may need to pull a clone of your code, this will only be done with your consent. Support staff does not have direct access to clone any repository, they will need to temporarily attach their SSH key to your account to pull a clone. When working a support issue we do our best to respect your privacy as much as possible, we only access the files and settings needed to resolve your issue.

# Maintaining security

We protect your login from brute force attacks with rate limiting. All passwords are filtered from all our logs and are one-way encrypted in the database using bcrypt. Login information is always sent over SSL.

We also allow you to use two-factor authentication, or 2FA, as an additional security measure when accessing your Exploratory account. Enabling 2FA adds security to your account by requiring both your password as well as access to a security code on your phone to access your account.

We have full time security staff to help identify and prevent new attack vectors. We always test new features in order to rule out potential attacks, such as XSS-protecting wikis, and ensuring that Pages cannot access cookies.

We also maintain relationships with reputable security firms to perform regular penetration tests and ongoing audits of Exploratory and its code.

We're extremely concerned and active about security, but we're aware that many companies are not comfortable hosting code outside their firewall. For these companies we offer Exploratory Enterprise, a version of Exploratory that can be installed to a server within the company's network.

# Credit Card Security

We hand off credit card processing to Stripe. They power online transactions for thousands of business and SaaS platforms and comply with PCI standards in the storage and handling of credit card information.

# Need to Report a Security Vulnerability?

Publicly disclosing a vulnerability can put the entire Exploratory community at risk. If you have discovered a possible vulnerability we would greatly appreciate you emailing us at support@exploratory.io. We will work with you to assess and understand the scope of the issue and fully address any concerns. Any emails are immediately sent to our engineering staff to ensure that issues are addressed rapidly. Any security emails are treated with the highest priority as the safety and security of our service is our primary concern.

# Notificaitons

All security-related notifications will be announced to our customers via the Security Bulletins community page at https://community.exploratory.io/c/security. This page also includes information about our response to Internet-wide security vulnerabilities that impact Exploratory products and services, release notes about security bug fixes and disclosed vulnerabilities, and anything else that our customers should know about.


# Contact Us

Have a question, concern, or comment about Exploratory security? Please contact [Exploratory Support](mailto:support@exploratory.io).
